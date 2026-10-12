# Install the RTX 4060 Laptop driver with NullMoth

[Tiếng Việt](NVIDIA.vi.md) · [macOS installation](INSTALL.en.md) · [Configuration](CONFIGURATION.md)

## 1. Before opening the app

Finish macOS installation in Hybrid/iGPU mode and reach the desktop. **Shut down completely**, enter BIOS, **disable iGPU/select Discrete Graphics or dGPU Only**, then boot the installed macOS through the same USB. This is the owner's Y9000P procedure; laptops without a suitable MUX/NVIDIA display route need separate verification.

Keep the `installer` profile for the first boot before the driver exists. Disabling iGPU does not install an NVIDIA driver. Apply the NVIDIA profile only after driver installation and before its restart.

## 2. Use 1401 Mac 1.14.0

1. Extract `NullMoth/current/1401-Mac-1.14.0.zip` on macOS and open `1401.app`. Alternatively, obtain the DMG from the [official release](https://github.com/nullmoth/nvidia-macos-driver/releases/tag/v1.14.0). Check download hashes before running it.
2. **Keep the OpenCore USB used for this boot connected.** Verify the selected startup partition containing `EFI/OC/config.plist`. A matching SMBIOS model alone is insufficient to identify the USB; explicitly choose the actual device/partition if prompted.
3. Read the checks and proposed changes, then use the NVIDIA install/update function. Button names can change between app versions. Provide administrator authorization when the installer requests it.
4. Let the app install the package and update the active EFI. Do not overwrite that config with another template afterward: that would discard app changes and your identity.
5. Restart through the USB. If macOS requests extension approval, use **System Settings → Privacy & Security**, approve the extensions and restart again as directed.

See the [official app instructions](https://github.com/nullmoth/nvidia-macos-driver/blob/v1.14.0/README.md#1401-mac-app-easiest). The driver still needs testing on each laptop; inclusion of the RTX 4060 family in a device table does not qualify every laptop display route.

## 3. Configuration transition

| Setting | Before driver / installer | After installation / NVIDIA |
| --- | --- | --- |
| `UEFI/Quirks/ResizeGpuBars` | `-1` | `13` |
| `Booter/Quirks/ResizeAppleGpuBars` | `0` | `-1` |
| Block `com.apple.iokit.IONDRVSupport` | `Enabled=false` | `Enabled=true`, `Strategy=Exclude` |
| `Misc/Security/SecureBootModel` | `Disabled` | `Disabled` |

These NVIDIA values match the source machine's runtime config and the [upstream configuration reference](https://github.com/nullmoth/nvidia-macos-driver/blob/v1.14.0/README.md#wiring-into-an-existing-opencore-setup). BAR value `13` is the upstream 8 GB-window setting; the app and firmware must verify this machine's requirements. Do not apply it indiscriminately to different GPUs.

Within NVRAM GUID `7C436110-AB2A-4BBB-A880-FE41995C9F82`:

```text
csr-active-config (Data): 430A0000
boot-args additions:
nvfb=1 nvaccel=1 nvfbheads=4 -nvkmsnosmooth
amfi_get_out_of_my_way=0x1 amfi=0x80 ipc_control_port_options=0
```

AMFI/SIP settings reduce some protections to load the non-Apple driver; they are functional requirements, not performance toggles. Retain the machine's CPU/audio arguments rather than replacing the entire string. Do not use `nv_disable=1` or `agdpmod=pikera` for this driver path. Let the app handle requirements and the corresponding NVRAM changes.

Driver kexts belong in macOS and its Auxiliary Kernel Collection. **Do not also inject** them from `EFI/OC/Kexts`. Keep Above 4G Decoding On and CSM Off where firmware exposes them.

## 4. Manual package installation

This is an alternative to the app. Use a separate working directory to avoid mixing `pkgroot` from different versions. First verify the archive:

```sh
cd /Volumes/YOUR_USB/NullMoth/current
shasum -a 256 nullmoth-nvidia-1.14.0.tar.gz
```

Compare with `current/SHA256SUMS.txt`. Copy the archive into a macOS working directory, then run:

```sh
tar -xzf nullmoth-nvidia-1.14.0.tar.gz
cd pkgroot
shasum -a 256 -c SHA256SUMS
sudo ./install.sh
```

Every content-check line should report `OK`. Before rebooting, set the **actual USB config** to the NVIDIA profile, retaining your personalized SMBIOS. If the USB also contains `scripts`:

```sh
python3 /Volumes/YOUR_USB/scripts/configure.py \
  --config /Volumes/YOUR_USB/EFI/OC/config.plist --profile nvidia
sudo shutdown -r now
```

Replace `YOUR_USB` with the actual volume name and quote paths containing spaces. The helper sets the table values and current boot arguments; it does not validate BIOS conditions or install the driver. Approve extensions in Privacy & Security when prompted. Consult [upstream manual installation](https://github.com/nullmoth/nvidia-macos-driver/blob/v1.14.0/README.md#install--prebuilt-recommended).

## 5. Verify after restarting

```sh
system_profiler SPDisplaysDataType
kmutil showloaded --list-only | grep -i nullmoth
nvram boot-args
csrutil status
```

Check the RTX 4060 Laptop identity, VRAM, Metal status and loaded components such as NVRM/NVAccel/NVRMFB/NVRMAGDC. Avoid publishing full `nvram -p` output or unredacted reports containing identity/address data. Test a Metal application, resolution changes and each display connection. A GPU name without working Metal is not sufficient proof of acceleration.

The first boot can pause at `PCI configuration end` during GPU initialization, as described upstream. If it remains stuck or repeatedly panics, follow the recovery path below rather than rebooting indefinitely.

## 6. Uninstall or recover

If the app added **1401: Remove NVIDIA driver** to OpenCore, use that entry for its uninstall/restore procedure. The current app also offers **1401: Start once without NVIDIA driver**; check which entries it actually added to your EFI.

For manual installation, use the correct package's `pkgroot` and upstream uninstall instructions:

```sh
sudo ./uninstall.sh
sudo shutdown -r now
```

To return to `installer`, modify the **current config** with the helper so its identity remains intact, or restore the private pre-install configuration. Return to Hybrid if necessary for display routing. Changing BAR values alone does not remove kexts installed in macOS; use the driver's uninstall or safe-start facility.

## 7. Archived versions and updates

The source USB stores driver **1.0.11** and app **1.0.18**. The **1.14.0** pair was added separately in `current/` and verified against upstream checksums on 2026-10-12. Do not install both versions at once. Save the active config, read the [release notes](https://github.com/nullmoth/nvidia-macos-driver/releases/tag/v1.14.0) and verify graphics again after restarting.

The current app's experimental AMD/Intel/NPU drivers are outside this NVIDIA procedure; do not enable them merely because the option exists. This guide targets Sequoia 15 and does not automatically upgrade macOS to Tahoe.
