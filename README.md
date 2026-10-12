# Kayn — Y9000P IRX9 / macOS Sequoia

**Primary language: English.** [Tiếng Việt](README.vi.md)

This repository replaces the earlier scaffold with the complete EFI copied from Kayn's USB on 12 October 2026. It targets a Lenovo Legion Y9000P IRX9 with an Intel i9-14900HX and an NVIDIA RTX 4060 Laptop GPU.

The installation order is:

1. Enable iGPU/Hybrid mode and install macOS Sequoia using the installer profile.
2. Finish Setup Assistant and shut down completely.
3. Disable iGPU/select dGPU Only in BIOS, then boot the installed macOS using the same USB and installer profile.
4. Install the NullMoth NVIDIA driver with the 1401 Mac app.
5. Restart, approve extensions if prompted, restart again as needed, and verify the GPU and Metal.

See the [complete installation guide](docs/INSTALL.en.md) and [NVIDIA guide](docs/NVIDIA.en.md) before beginning. The BIOS sequence is owner supplied, and an unaccelerated pre-driver desktop is expected. Switching the display route does not install a GPU driver.

Download the [Release bundles](https://github.com/ndh0408/Hackintosh-Y9000P/releases). The EFI bundle contains every EFI binary and guide. The full USB bundle adds Apple Recovery and both the archived and current NullMoth packages. Recovery still needs Internet to download macOS. Files larger than Git's practical limits are distributed as Release assets.

Public configurations use placeholder serial/MLB/UUID/ROM values. Saved Wi-Fi networks and passwords were cleared. Generate your own identity for the retained `MacBookPro16,2` model using GenSMBIOS, then run:

```sh
python scripts/verify.py --allow-placeholders --hashes
python scripts/configure.py --identity --profile installer
python scripts/verify.py
```

Checksums apply to the downloaded files before personal edits. Configuration backups created by the helper are private and Git-ignored. Run the helper against the actual USB config with `--config` if you personalize after copying.

The public default config is for installation: GPU BAR quirks `-1/0` and the IONDRVSupport block disabled. The NVIDIA profile uses `13/-1` with IONDRVSupport excluded. Let 1401 preview and apply its required configuration changes when installing. The profile helper is available for explicit manual switching; it preserves the active SMBIOS and hardware patches.

Current NullMoth packages are **1.14.0**, checked against the official release on 12 October 2026. The original USB also contains driver **1.0.11** and companion **1.0.18**; those historical packages are clearly labeled in the full bundle. The companion and driver version numbers need not match in the archived pair.

The retained OpenCore is a custom snapshot with an uninformative embedded version. Public configuration passes the 1.0.3 schema validator; an exact upstream firmware version is not asserted. No firmware or kext upgrade was substituted for the USB components. Ten missing schema keys were explicitly filled for the public template.

This update passed static validation, not a new macOS boot test. The owner previously reported booting and recognition of the RTX 4060; that does not prove every driver feature. See [hardware status](docs/HARDWARE.md), [configuration details](docs/CONFIGURATION.md), [troubleshooting](docs/TROUBLESHOOTING.md), and [validation scope](docs/VALIDATION.md).

## Documentation

| Topic | English (primary) | Tiếng Việt |
| --- | --- | --- |
| USB, BIOS, partitioning, macOS installation | [Installation](docs/INSTALL.en.md) | [Cài macOS](docs/INSTALL.vi.md) |
| Disable iGPU, install NVIDIA, verify and uninstall | [NVIDIA driver](docs/NVIDIA.en.md) | [Driver NVIDIA](docs/NVIDIA.vi.md) |
| Hardware inventory and tested status | [Hardware](docs/HARDWARE.md) | Bilingual |
| Profiles and exact configuration values | [Configuration](docs/CONFIGURATION.md) | Bilingual |
| Failures and recovery | [Troubleshooting](docs/TROUBLESHOOTING.md) | Bilingual |
| Checks performed and remaining limits | [Validation](docs/VALIDATION.md) | Bilingual |
| Authors and original software licenses | [Third-party components](THIRD_PARTY.md) | Bilingual |

## Package layout

```text
EFI/BOOT/BOOTx64.efi
EFI/OC/config.plist             # public installer template
EFI/OC/ACPI/SSDT-Kayn.aml       # optional table; disabled by default
EFI/OC/Drivers/, Kexts/, Resources/, Tools/
configs/config-installer.plist
configs/config-nvidia.plist
configs/archive/
NullMoth/README.md
NullMoth/system-profile.json
scripts/configure.py
scripts/verify.py
INSTALL-README.txt
SHA256SUMS.txt
```

The full USB Release also contains `com.apple.recovery.boot` and `NullMoth/current`. Open the archive's outer folder, personalize the active config and copy the contents to the FAT32 USB root. Do not nest `EFI` one directory below the root.

Kayn maintains the configuration and documentation. OpenCore, driver and kext authors retain their original rights and licenses; see [third-party components](THIRD_PARTY.md).
