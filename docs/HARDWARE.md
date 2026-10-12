# Hardware and status / Phần cứng và trạng thái

Dữ liệu từ profile máy nguồn trên USB, không phải báo cáo kiểm thử macOS. / Inventory comes from the source USB profile, not a macOS test report.

| Thành phần / Component | Máy nguồn / Source machine | Trạng thái / Status |
| --- | --- | --- |
| Model | Lenovo Legion Y9000P IRX9; board LNVNB161216 | Mục tiêu bộ này / Target of this snapshot |
| CPU | Intel Core i9-14900HX, Raptor Lake-HX, 24 cores | Có CPUID spoof và kext topology/TSC / CPUID spoof and topology/TSC kexts included |
| Chipset / BIOS | HM770; N0CN35WW; UEFI | BIOS scan không xác nhận tùy chọn setup / Scan does not establish BIOS setup options |
| dGPU | RTX 4060 Laptop; PCI `10DE:28E0`; subsystem `17AA:3CF2` | Chủ máy báo từng nhận GPU; Metal của bản cập nhật chưa thử / Owner reported earlier recognition; updated snapshot's Metal untested |
| iGPU | Intel integrated graphics, theo quy trình Hybrid của chủ máy / owner's Hybrid procedure | Dùng lúc cài; profile được thu ở dGPU mode chỉ liệt kê NVIDIA / Used during installation; captured dGPU-mode profile lists NVIDIA only |
| Internal display | BOE0C1D, eDP | Profile ghi route NVIDIA; cần kiểm tra thực tế MUX / Profile records NVIDIA route; actual MUX behavior needs testing |
| External display in scan | MSI MAG 274QF X32, DP | Không bảo đảm mọi cổng / Does not qualify every output |
| Ethernet | Realtek PCIe GbE `10EC:8168` | RealtekRTL8111 included; runtime verification required |
| Wi-Fi | Intel AX211 `8086:7A70` | itlwm included; saved credentials cleared; operation unverified |
| Bluetooth | Intel USB `8087:0033` | IntelBluetoothFirmware, IntelBTPatcher, BlueToolFixup included; operation unverified |
| Audio | Realtek `10EC:0257` (ALC257); source `alcid=101` | AppleALC included; actual speakers/mic/headset unverified |
| Touchpad / keyboard | HID ACPI touchpad; PS/2 keyboard | VoodooI2C-RPL-GPIO, VoodooI2CHID and VoodooPS2Controller configured |
| Storage | WD SN810/SN850 controller `15B7:5011`; Samsung PM9A1/PM9A3/980PRO controller `144D:A80A` | NVMeFix included; use actual volume identity when installing |
| USB | Intel XHCI `8086:7A60` | USBToolBox + source UTBMap; remap on different port topology |
| RAM | Không có dung lượng đáng tin trong profile / capacity not reliably recorded | Không suy đoán / Not inferred |
| Battery / sensors | SMCBatteryManager, YogaSMC, sensor plugins | Kext presence is not proof of functional battery/fans |
| Sleep / camera / HDMI-DP audio | Chưa có kết quả / no results captured | Chưa kiểm chứng / Unverified |

`NullMoth/system-profile.json` có `qualification.boot/graphics/network = unverified`, USB `mapping_required`. Chuỗi `macos_version=24.99.99` là giá trị profile, không được dùng để kết luận phiên bản macOS đang chạy.

`NullMoth/system-profile.json` retains `qualification.boot/graphics/network = unverified` and USB `mapping_required`. Its `macos_version=24.99.99` field does not establish the installed macOS version.

## User verification / Kiểm tra của người dùng

Ghi lại model BIOS, graphics mode, macOS build, phiên bản driver, GPU/Metal, từng cổng USB/display, âm thanh, mạng và sleep sau khi thử. Không đăng serial/UUID hoặc mật khẩu mạng. / Record BIOS, graphics mode, macOS build, driver version, GPU/Metal, individual USB/display ports, audio, networking and sleep after testing. Keep identity and network passwords private.
