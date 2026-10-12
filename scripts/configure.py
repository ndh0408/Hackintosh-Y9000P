#!/usr/bin/env python3
"""Prepare a personal OpenCore configuration without replacing hardware patches."""
import argparse
import datetime
import getpass
import plistlib
import re
import sys
import uuid
from pathlib import Path

if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8")
if hasattr(sys.stderr, "reconfigure"):
    sys.stderr.reconfigure(encoding="utf-8")

GUID = "7C436110-AB2A-4BBB-A880-FE41995C9F82"
ROOT = Path(__file__).resolve().parents[1]
REQUIRED_ARGS = "nvfb=1 nvaccel=1 nvfbheads=4 -nvkmsnosmooth amfi_get_out_of_my_way=0x1 amfi=0x80 ipc_control_port_options=0".split()


def apply_profile(config, profile):
    if profile == "keep":
        return
    runtime = profile == "nvidia"
    config["UEFI"]["Quirks"]["ResizeGpuBars"] = 13 if runtime else -1
    config["Booter"]["Quirks"]["ResizeAppleGpuBars"] = -1 if runtime else 0
    matches = [x for x in config["Kernel"]["Block"] if x["Identifier"] == "com.apple.iokit.IONDRVSupport"]
    if len(matches) != 1:
        raise ValueError("Expected one IONDRVSupport block entry")
    matches[0]["Enabled"] = runtime
    matches[0]["Strategy"] = "Exclude"
    if runtime:
        nvram = config["NVRAM"]["Add"][GUID]
        args = [x for x in nvram.get("boot-args", "").split() if not (x.startswith("nv_disable=") or x == "agdpmod=pikera")]
        for arg in REQUIRED_ARGS:
            key = arg.split("=", 1)[0]
            args = [x for x in args if x.split("=", 1)[0] != key]
            args.append(arg)
        nvram["boot-args"] = " ".join(args)
        nvram["csr-active-config"] = bytes.fromhex("430A0000")
        config["Misc"]["Security"]["SecureBootModel"] = "Disabled"
        deleted = config["NVRAM"]["Delete"].setdefault(GUID, [])
        for key in ("boot-args", "csr-active-config"):
            if key not in deleted:
                deleted.append(key)


def set_identity(config):
    generic = config["PlatformInfo"]["Generic"]
    print("Model / Mẫu SMBIOS:", generic["SystemProductName"])
    print("Use GenSMBIOS/macserial for this model. Values are hidden while typing.")
    print("Dùng GenSMBIOS/macserial cho mẫu này. Giá trị nhập được ẩn.")
    serial = getpass.getpass("SystemSerialNumber: ").strip().upper()
    mlb = getpass.getpass("MLB / Board Serial: ").strip().upper()
    system_uuid = str(uuid.UUID(getpass.getpass("SystemUUID: ").strip())).upper()
    rom_text = re.sub(r"[:-]", "", getpass.getpass("ROM / Ethernet MAC (12 hex): ").strip())
    if not re.fullmatch(r"[A-Z0-9]{11,12}", serial) or "KAYN" in serial or serial == "0" * len(serial):
        raise ValueError("Provide a personal serial generated for your SMBIOS model")
    if not re.fullmatch(r"[A-Z0-9]{17}", mlb) or mlb == "KAYN0000000000000" or mlb == "0" * 17:
        raise ValueError("MLB must be a personal 17-character board serial")
    if not re.fullmatch(r"[0-9a-fA-F]{12}", rom_text) or int(rom_text, 16) == 0:
        raise ValueError("ROM must be a nonzero 6-byte MAC address")
    if uuid.UUID(system_uuid).int == 0:
        raise ValueError("SystemUUID must be a personal nonzero UUID")
    generic.update(SystemSerialNumber=serial, MLB=mlb, SystemUUID=system_uuid, ROM=bytes.fromhex(rom_text))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--config", type=Path, default=ROOT / "EFI/OC/config.plist")
    parser.add_argument("--profile", choices=("installer", "nvidia", "keep"), default="keep")
    parser.add_argument("--identity", action="store_true", help="Prompt for your own SMBIOS values")
    options = parser.parse_args()
    path = options.config.resolve(strict=True)
    original = path.read_bytes()
    config = plistlib.loads(original)
    if options.identity:
        set_identity(config)
    apply_profile(config, options.profile)
    encoded = plistlib.dumps(config, sort_keys=False)
    if encoded == original:
        print("No changes / Không có thay đổi")
        return
    backup_dir = ROOT / ".local-backups"
    backup_dir.mkdir(exist_ok=True)
    stamp = datetime.datetime.now().strftime("%Y%m%d-%H%M%S-%f")
    backup = backup_dir / ("config-" + stamp + ".plist")
    backup.write_bytes(original)
    temp = path.with_name(path.name + ".kayn-tmp")
    with temp.open("xb") as stream:
        stream.write(encoded)
    temp.replace(path)
    print("Updated / Đã cập nhật:", path)
    print("Private local backup / Bản lưu riêng tư:", backup)
    print("Profile / Chế độ:", options.profile)


if __name__ == "__main__":
    main()
