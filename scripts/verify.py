#!/usr/bin/env python3
"""Check the EFI tree, configuration references, AML checksums and file hashes."""
import argparse
import hashlib
import plistlib
import struct
import sys
from pathlib import Path

if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8")
if hasattr(sys.stderr, "reconfigure"):
    sys.stderr.reconfigure(encoding="utf-8")

ROOT = Path(__file__).resolve().parents[1]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=ROOT)
    parser.add_argument("--allow-placeholders", action="store_true")
    parser.add_argument("--hashes", action="store_true", help="Verify SHA256SUMS.txt before personal edits")
    options = parser.parse_args()
    root = options.root.resolve()
    oc = root / "EFI/OC"
    for path in (root / "EFI/BOOT/BOOTx64.efi", oc / "OpenCore.efi"):
        assert path.is_file(), f"Missing: {path}"
    plists = list(root.rglob("*.plist"))
    for path in plists:
        if ".local-backups" not in path.parts:
            plistlib.loads(path.read_bytes())
    cfg = plistlib.loads((oc / "config.plist").read_bytes())
    for entry in cfg["ACPI"]["Add"]:
        assert (oc / "ACPI" / entry["Path"]).is_file(), "Missing ACPI: " + entry["Path"]
    for entry in cfg["Kernel"]["Add"]:
        bundle = oc / "Kexts" / entry["BundlePath"]
        assert bundle.is_dir(), "Missing kext: " + entry["BundlePath"]
        for key in ("PlistPath", "ExecutablePath"):
            if entry.get(key):
                assert (bundle / entry[key]).is_file(), f"Missing kext {key}: {bundle}"
    for group, folder in ((cfg["UEFI"]["Drivers"], "Drivers"), (cfg["Misc"]["Tools"], "Tools")):
        for entry in group:
            if entry["Enabled"]:
                assert (oc / folder / entry["Path"]).is_file(), f"Missing {folder}: " + entry["Path"]
    aml_files = list((oc / "ACPI").glob("*.aml"))
    for path in aml_files:
        data = path.read_bytes()
        assert len(data) >= 36 and struct.unpack_from("<I", data, 4)[0] == len(data), f"Invalid AML length: {path}"
        assert sum(data) % 256 == 0, f"Invalid AML checksum: {path}"
    generic = cfg["PlatformInfo"]["Generic"]
    placeholder = generic["SystemSerialNumber"] == "C02KAYN00000" or generic["MLB"] == "KAYN0000000000000" or generic["SystemUUID"] == "00000000-0000-0000-0000-000000000000" or generic["ROM"] == bytes(6)
    if placeholder and not options.allow_placeholders:
        raise ValueError("SMBIOS placeholders remain: run scripts/configure.py --identity --profile installer")
    if options.hashes:
        checked = 0
        for line in (root / "SHA256SUMS.txt").read_text(encoding="utf-8").splitlines():
            digest, relative = line.split("  ", 1)
            path = (root / relative).resolve()
            assert path.is_relative_to(root), "Hash path escapes root"
            h = hashlib.sha256()
            with path.open("rb") as stream:
                for chunk in iter(lambda: stream.read(4 * 1024 * 1024), b""):
                    h.update(chunk)
            assert h.hexdigest() == digest, "Hash mismatch: " + relative
            checked += 1
        print("SHA-256 files checked / File đã kiểm tra:", checked)
    print(f"OK: {len(plists)} plist files, {len(aml_files)} ACPI tables, all configured EFI paths")
    print("SMBIOS:", "public placeholders / mẫu công khai" if placeholder else "personal values / giá trị riêng")
    print("Static checks only. Run the matching ocvalidate and verify actual boot separately.")
    print("Đây là kiểm tra tĩnh. Cần kiểm tra ocvalidate tương ứng và boot thực tế riêng.")


if __name__ == "__main__":
    main()
