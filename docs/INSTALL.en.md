# Install macOS Sequoia — Kayn Y9000P IRX9

[Tiếng Việt](INSTALL.vi.md) · [Home](../README.md) · [NVIDIA installation](NVIDIA.en.md)

## 1. Prepare

The target machine is a Lenovo Legion Y9000P IRX9, Intel i9-14900HX and RTX 4060 Laptop. CPU patches, ACPI tables, the touchpad configuration and USB map come from the source machine. Another laptop with the same product name may differ. Consult the [hardware inventory](HARDWARE.md).

Have a USB with approximately 16–32 GB of FAT32 space, AC power, wired Internet, access to Windows or another computer for editing the USB, and backups of important data. The included Recovery environment downloads macOS over the Internet; it is not a full offline installer.

Download `Kayn-Full-USB-2026.10.12.zip` and `SHA256SUMS.txt` from [Releases](https://github.com/ndh0408/Hackintosh-Y9000P/releases). The smaller EFI bundle is for users who already have their own Recovery files. In PowerShell:

```powershell
Get-FileHash -Algorithm SHA256 '.\Kayn-Full-USB-2026.10.12.zip'
```

Compare the result with its line in `SHA256SUMS.txt`, then extract the archive locally. Open the outer `Kayn-Full-USB-2026.10.12` folder to find `EFI`, `com.apple.recovery.boot`, `NullMoth`, `docs` and `scripts`.

## 2. Prepare a personal SMBIOS

Do not boot with the template serial/MLB/UUID/ROM. The USB's original `MacBookPro16,2` model is retained. Do not silently change the model during driver installation.

1. Install Python 3.9 or newer and check `python --version`. On macOS, use `python3` when appropriate.
2. Obtain [official GenSMBIOS](https://github.com/corpnewt/GenSMBIOS). Follow its README to obtain/run macserial and generate a Serial plus Board Serial/MLB for **MacBookPro16,2**. Do not copy another person's genuine Mac identity.
3. Generate a UUID with PowerShell `[guid]::NewGuid().ToString().ToUpper()` or macOS `uuidgen`.
4. Use your machine's Ethernet MAC, without `:` or `-`, as the 12 hexadecimal digits of ROM. Avoid a Wi-Fi address that changes through randomization.
5. In the extracted Kayn folder, run:

```sh
python scripts/verify.py --allow-placeholders --hashes
python scripts/configure.py --identity --profile installer
python scripts/verify.py
```

Input is hidden. The preceding config is saved in `.local-backups`; keep that directory and personalized configurations private. Original checksums change after personalization. The `configs/` files are reference templates: retain your personal identity in the active `EFI/OC/config.plist` once it is prepared.

## 3. Prepare the USB from Windows

If the USB already has a suitable FAT32 partition, reuse it after saving its old EFI. To create a new USB, identify it by name and capacity before formatting. [Rufus](https://rufus.ie/) can use **Non bootable**, GPT/UEFI and FAT32. Alternatively, create a FAT32 USB partition up to 32 GB with Disk Management. Formatting erases the selected USB partition; do not select the Windows/macOS SSD.

After personalization, copy the **contents** of the extracted folder to the FAT32 volume root. Required layout:

```text
USB:/EFI/BOOT/BOOTx64.efi
USB:/EFI/OC/OpenCore.efi
USB:/EFI/OC/config.plist
USB:/com.apple.recovery.boot/BaseSystem.dmg
USB:/com.apple.recovery.boot/BaseSystem.chunklist
USB:/NullMoth/current/1401-Mac-1.14.0.zip
USB:/NullMoth/current/nullmoth-nvidia-1.14.0.tar.gz
```

Do not nest it as `USB:/Kayn-Full-USB.../EFI` or `USB:/EFI/EFI`. Documentation and packages can remain beside the boot folders. Keep a single clearly identified EFI on the USB to avoid selecting the wrong OpenCore in the app.

If you downloaded only the EFI bundle, supply your own Sequoia Recovery files in `com.apple.recovery.boot`. [1401 for Windows](https://github.com/nullmoth/1401) and [OpenCore macrecovery](https://github.com/acidanthera/OpenCorePkg/tree/master/Utilities/macrecovery) are official tools. Select **macOS 15 Sequoia**; an automatically selected latest OS is not necessarily Sequoia. Use your personalized Kayn EFI for this guide after another tool creates Recovery.

## 4. BIOS before installation: enable iGPU

Shut down, then open BIOS using the machine's BIOS key, commonly F2/Fn+F2 on Legion systems. Firmware menus vary. Record the previous settings.

| Setting | During installation |
| --- | --- |
| Graphics Mode / Hybrid / Switchable Graphics | **Hybrid, iGPU enabled** |
| Discrete Graphics / dGPU Only | Do not select yet |
| Firmware Secure Boot | Off |
| Boot mode | UEFI; CSM/Legacy Off |
| Above 4G Decoding | On if exposed; required for the NVIDIA path |
| Other settings | Retain the machine's established boot settings |

Hybrid follows the owner's installation display-routing procedure. A visible desktop does not prove accelerated Raptor Lake-HX Intel graphics. If Above 4G/ReBAR settings are hidden, use official firmware diagnostics and logs rather than random BIOS unlock/flash instructions.

Use the `installer` profile: `ResizeGpuBars=-1`, `ResizeAppleGpuBars=0`, IONDRVSupport block disabled. Do not select the NVIDIA runtime profile while installing or before the driver is present.

## 5. Boot Recovery and choose the target volume

1. Connect AC power, USB and Ethernet. Open the boot menu, commonly F12/Fn+F12, and select the USB's **UEFI** entry.
2. In OpenCore choose Recovery/Installer. Press **Space** if `HideAuxiliary` hides it.
3. In Recovery, open Disk Utility and select **View → Show All Devices** to identify the disk/container.
4. On a disk shared with Windows or data, erase only the confirmed macOS volume/container. Do not erase its parent SSD simply because it also holds macOS.
5. The source machine's notes identify a Samsung PM9A1 for Windows and a WD SN810/SN850 for macOS/data. This is an inventory, not an instruction to erase every WD SSD. The approximately 400 GiB target mentioned in the old local notes is not a universal partition size.
6. For a disk dedicated entirely to macOS, prepare GUID Partition Map/APFS only after confirming that the whole disk may be erased. Give the volume a recognizable name, such as `macOS`.
7. Close Disk Utility, start Install macOS Sequoia, and select the intended volume. Keep Internet connected while Recovery downloads the installer.

If Windows partition space must be freed, prepare unallocated space using Disk Management after backing up. Do not reuse old automatic formatting scripts or `diskpart clean` without checking the selected physical device.

## 6. Installation restarts

Keep the USB attached. After each restart, boot UEFI USB again and choose **macOS Installer** or the macOS SSD entry appropriate to that phase. Do not repeatedly return to Recovery to erase and reinstall.

Complete Setup Assistant, create the macOS account and reach the desktop. You can postpone Apple ID until identity and networking are checked. Before the NVIDIA driver, slow drawing, missing Metal and imperfect resolution may occur.

Only consider OS installation finished after reaching the desktop. Do not change the graphics mode halfway through unfinished installer stages.

## 7. After installation: shut down, disable iGPU, boot again

1. Select Apple menu → **Shut Down** and wait for a complete power-off.
2. Enter BIOS and change Hybrid/Switchable Graphics to **Discrete Graphics / dGPU Only**: **disable iGPU** for this machine's owner-supplied sequence. Save BIOS.
3. Boot the same USB and choose the installed macOS on the SSD.
4. Retain the `installer` profile for this first pre-driver boot so firmware framebuffer support remains available.
5. If the screen is black after changing modes, try an output supported by firmware or return to Hybrid for diagnosis. Do not erase macOS. See [recovery guidance](TROUBLESHOOTING.md).

## 8. Install the NVIDIA driver

Continue with [NVIDIA.en.md](NVIDIA.en.md): run 1401 Mac **1.14.0**, select/verify the USB OpenCore that actually booted macOS, preview changes, install, approve extensions if requested and restart. The app handles the installer-to-driver configuration transition. A separate manual `.tar.gz` path is documented there.

Do not simultaneously inject NVRM/NVAccel through `EFI/OC/Kexts`. Keep the boot USB attached while the app modifies EFI and through the restarts. Do not change the SMBIOS serial/model after app identification.

## 9. Verify

In Terminal:

```sh
system_profiler SPDisplaysDataType
kmutil showloaded --list-only | grep -i nullmoth
csrutil status
```

Check the RTX 4060 Laptop identity, Metal status and loaded NVIDIA kexts. Then test resolution, internal/external displays, audio, LAN, Wi-Fi/Bluetooth, touchpad, battery and sleep/wake. Record results individually; a GPU name alone does not prove acceleration.

Keep a personalized installer EFI for recovery and continue USB booting until an internal boot configuration has been separately reviewed. The snapshot's “Add OpenCore SSD Boot” entry is not needed for this USB procedure.
