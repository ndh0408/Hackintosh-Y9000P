# OpenCore configuration / Cấu hình OpenCore

## Profiles

| File | Tiếng Việt | English |
| --- | --- | --- |
| `EFI/OC/config.plist` | Mẫu mặc định cài mới; cá nhân hóa trước khi boot | Default installation template; personalize before boot |
| `configs/config-installer.plist` | Bản mẫu installer để tham khảo/khôi phục | Installer reference/recovery template |
| `configs/config-nvidia.plist` | Mẫu chạy NVIDIA với tham số 1.14.0 | NVIDIA reference with 1.14.0 arguments |
| `configs/archive/` | Các bản cấu hình lịch sử đã ẩn danh tính | Sanitized historical config snapshots |

Các mẫu đều dùng danh tính giả. Khi đã có config riêng, chuyển profile bằng helper thay vì copy đè mẫu. / All templates use placeholder identities. Once personalized, switch profiles with the helper rather than overwriting with templates.

```sh
python scripts/configure.py --config EFI/OC/config.plist --profile installer
python scripts/configure.py --config EFI/OC/config.plist --profile nvidia
```

Dòng đầu dùng trước cài macOS/khôi phục. Dòng thứ hai chỉ dùng khi driver đã được cài; app 1401 là đường cài chính và sẽ tự xử lý thay đổi. / Use the first before installation/recovery. Use the second only after the driver is installed. The 1401 app is the primary installation path and handles its changes itself.

## Key values / Các giá trị chính

| Key | Installer | NVIDIA |
| --- | --- | --- |
| `ResizeGpuBars` | `-1` | `13` |
| `ResizeAppleGpuBars` | `0` | `-1` |
| `IONDRVSupport` block | Disabled | Enabled, Exclude |
| SMBIOS model | `MacBookPro16,2` | Same personal identity |
| `SecureBootModel` | `Disabled` | `Disabled` |
| `csr-active-config` | Source value `430A0000` | `430A0000` |
| `ScanPolicy` | `0` | `0` |
| `ShowPicker` / `Timeout` | True / 10 seconds | True / 10 seconds |

Upstream nêu ví dụ `iMacPro1,1`; bộ này giữ `MacBookPro16,2` của máy nguồn. Đây là khác biệt cần kiểm tra, không phải cam kết mọi model được upstream kiểm chứng. / Upstream uses an `iMacPro1,1` example. This snapshot retains the source machine's `MacBookPro16,2`; that difference requires verification rather than an assertion of upstream qualification.

## CPU, ACPI and devices / CPU, ACPI và thiết bị

- CPUID data: `55060A00000000000000000000000000`; mask `FFFFFFFF000000000000000000000000`. Giữ từ snapshot / retained from the snapshot.
- ACPI bật / enabled: SSDT-SBUS, EC, PLUG-ALT, USB-Reset, GPI0, RTCAWAC, USBX, MCHC, XOSI.
- `SSDT-Kayn.aml` được giữ nhưng **Disabled** như config nguồn; không bật cùng các bảng tách rời chỉ vì tên mới. / `SSDT-Kayn.aml` is retained but **disabled**, as in the source config; do not enable it alongside separate tables merely because it has a new name.
- ACPI rename: `_OSI → XOSI` và / and `GPI0 _STA → XSTA`.
- DeviceProperties nằm tại / are at `PciRoot(0x0)/Pci(0x17,0x0)` and `PciRoot(0x0)/Pci(0x1F,0x3)`; không thêm thuộc tính NVIDIA để “fix” chung / no generic NVIDIA DeviceProperties patch was added.
- Boot-args giữ / retained: `alcid=101 watchdog=0 npci=0x3000 -igfxvesa ctrsmt=full debug=0x100 keepsyms=1`, cùng các tham số NVIDIA đã có / along with existing NVIDIA arguments.
- NVIDIA profile adds `ipc_control_port_options=0` for the documented current driver.
- `XhciPortLimit=True` và UTBMap nguồn được giữ; cần kiểm tra map trên máy khác. / Source `XhciPortLimit=True` and UTBMap are retained; verify/remap on other hardware.

## Schema and limits / Schema và giới hạn

Binary OpenCore nguồn có chuỗi version tùy biến không đủ xác định release. Không dùng thông tin “1.0.7” trong bộ repo cũ làm bằng chứng. Schema công khai được kiểm tra với `ocvalidate` 1.0.3. Các khóa vắng sau được điền theo mẫu 1.0.3:

The custom OpenCore binary does not identify a conclusive release. The old repository's “1.0.7” label is not evidence. Public files were checked using the 1.0.3 validator, with these previously absent keys explicitly filled from its sample:

```text
Booter/Quirks/FixupAppleEfiImages = true
Kernel/Quirks/DisableIoMapperMapping = false
Misc/Boot/InstanceIdentifier = ""
UEFI/Output/ConsoleFont = ""
UEFI/Output/GopBurstMode = false
UEFI/Output/InitialMode = "Auto"
UEFI/ProtocolOverrides/PciIo = false
UEFI/Quirks/ResizeUsePciRbIo = false
UEFI/Quirks/ShimRetainProtocol = false
UEFI/Unload = []
```

Đây là cấu hình công khai dựa trên snapshot, không phải build firmware mới. / This is a public configuration based on a snapshot, not a newly built firmware release.
