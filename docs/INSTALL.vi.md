# Cài macOS Sequoia — Kayn Y9000P IRX9

[English](INSTALL.en.md) · [Trang chủ](../README.md) · [Cài NVIDIA](NVIDIA.vi.md)

## 1. Chuẩn bị

Máy mục tiêu là Lenovo Legion Y9000P IRX9, i9-14900HX, RTX 4060 Laptop. EFI này có các bản vá CPU, ACPI, touchpad và USB dành cho máy nguồn; máy khác cùng tên vẫn có thể khác phần cứng. Xem [bảng phần cứng](HARDWARE.md).

Cần USB có phân vùng FAT32 khoảng 16–32 GB, sạc, kết nối Internet qua dây LAN, Windows đang dùng được hoặc máy khác để sửa USB khi cần, và bản sao dữ liệu quan trọng. Bộ Recovery chỉ có môi trường cài; macOS được tải qua mạng.

Tải `Kayn-Full-USB-2026.10.12.zip` và `SHA256SUMS.txt` từ [Release](https://github.com/ndh0408/Hackintosh-Y9000P/releases). Gói EFI nhỏ dùng khi bạn đã có Recovery riêng. Trong PowerShell:

```powershell
Get-FileHash -Algorithm SHA256 '.\Kayn-Full-USB-2026.10.12.zip'
```

So sánh hash với dòng tương ứng trong `SHA256SUMS.txt`, rồi giải nén vào một thư mục trên máy. ZIP có thư mục bao ngoài `Kayn-Full-USB-2026.10.12`; mở thư mục đó để thấy `EFI`, `com.apple.recovery.boot`, `NullMoth`, `docs` và `scripts`.

## 2. Tạo SMBIOS riêng

Không boot bằng serial/MLB/UUID/ROM mẫu. Cấu hình giữ mẫu `MacBookPro16,2` của USB gốc; không tự đổi model trong quá trình cài driver.

1. Cài Python 3.9 trở lên, dùng `python --version` để kiểm tra. Trên macOS có thể dùng `python3` thay `python`.
2. Tải [GenSMBIOS chính thức](https://github.com/corpnewt/GenSMBIOS), làm theo README để tải/chạy macserial và tạo Serial cùng Board Serial/MLB cho **MacBookPro16,2**. Không dùng serial thật của máy Mac của người khác.
3. Tạo UUID bằng PowerShell `[guid]::NewGuid().ToString().ToUpper()` hoặc lệnh `uuidgen` trên macOS.
4. Lấy MAC của card Ethernet của chính máy, bỏ dấu `-`/`:` để có ROM 12 chữ số hex; không lấy MAC ngẫu nhiên thay đổi mỗi lần kết nối Wi-Fi.
5. Từ thư mục bộ Kayn, chạy:

```sh
python scripts/verify.py --allow-placeholders --hashes
python scripts/configure.py --identity --profile installer
python scripts/verify.py
```

Script hỏi riêng từng giá trị và ẩn ký tự nhập. Bản config trước khi sửa lưu trong `.local-backups`; không đăng thư mục này hoặc config đã cá nhân hóa lên GitHub. Hash gốc sẽ đổi sau bước này, đó là bình thường. Các file trong `configs/` là mẫu tham khảo; khi đã cá nhân hóa hãy giữ nguyên danh tính trong `EFI/OC/config.plist` đang dùng.

## 3. Chuẩn bị USB từ Windows

Nếu USB đã có phân vùng FAT32 dùng được, có thể dùng luôn sau khi lưu lại EFI cũ. Nếu tạo USB mới, xác nhận đúng thiết bị theo dung lượng/tên trước khi format. Có thể dùng [Rufus](https://rufus.ie/) với **Non bootable**, GPT/UEFI và FAT32, hoặc Disk Management tạo một phân vùng FAT32 tối đa 32 GB trên USB. Bước format xóa dữ liệu của phân vùng USB được chọn; không chọn SSD Windows/macOS.

Sau khi cá nhân hóa, chép **nội dung** thư mục bộ Kayn ra gốc phân vùng FAT32. Cấu trúc boot phải là:

```text
USB:/EFI/BOOT/BOOTx64.efi
USB:/EFI/OC/OpenCore.efi
USB:/EFI/OC/config.plist
USB:/com.apple.recovery.boot/BaseSystem.dmg
USB:/com.apple.recovery.boot/BaseSystem.chunklist
USB:/NullMoth/current/1401-Mac-1.14.0.zip
USB:/NullMoth/current/nullmoth-nvidia-1.14.0.tar.gz
```

Không tạo `USB:/Kayn-Full-USB.../EFI` hoặc `USB:/EFI/EFI`. Tài liệu, scripts và gói driver có thể nằm ở gốc USB cùng hai thư mục boot. Giữ một EFI rõ ràng trên USB, tránh app nhận nhầm nhiều bản OpenCore.

Nếu chỉ tải gói EFI, bạn cần thêm Recovery Sequoia của riêng mình vào `com.apple.recovery.boot`. [1401 cho Windows](https://github.com/nullmoth/1401) và [OpenCore macrecovery](https://github.com/acidanthera/OpenCorePkg/tree/master/Utilities/macrecovery) là nguồn chính thức để chuẩn bị môi trường Recovery. Chọn macOS **15 Sequoia**; không mặc nhiên coi lựa chọn hệ điều hành mới nhất là Sequoia. Sau khi tạo Recovery bằng công cụ khác, dùng bộ EFI Kayn đã cá nhân hóa cho hướng dẫn này.

## 4. BIOS trước khi cài: bật iGPU

Tắt máy rồi vào BIOS bằng phím BIOS của máy (thường F2/Fn+F2 trên Legion; menu tùy firmware). Ghi lại thiết lập trước khi đổi.

| Mục | Khi cài |
| --- | --- |
| Graphics Mode / Hybrid / Switchable Graphics | **Hybrid, bật iGPU** |
| Discrete Graphics / dGPU Only | Chưa chọn trong giai đoạn cài |
| Secure Boot của firmware | Off |
| Boot Mode | UEFI; CSM/Legacy Off |
| Above 4G Decoding | On nếu BIOS có mục này; yêu cầu cho đường chạy NVIDIA |
| Các mục khác | Giữ cấu hình đã dùng để boot máy; không đổi hàng loạt |

Hybrid ở đây phục vụ quy trình xuất hình lúc cài do chủ máy cung cấp. Có màn hình không đồng nghĩa Intel UHD Raptor Lake-HX đã có Metal. Nếu BIOS không hiện Above 4G/ReBAR, không tự mở khóa/flash BIOS theo hướng dẫn ngẫu nhiên; dùng kiểm tra firmware và log của công cụ chính thức.

Config phải ở profile `installer`: `ResizeGpuBars=-1`, `ResizeAppleGpuBars=0`, block `IONDRVSupport` tắt. Không chuyển profile NVIDIA khi đang cài hoặc trước khi driver tồn tại.

## 5. Boot Recovery và chọn phân vùng

1. Cắm sạc, USB và LAN. Mở boot menu (thường F12/Fn+F12), chọn **UEFI của USB**.
2. Trong OpenCore chọn Recovery/Installer. Nhấn **Space** nếu mục bị ẩn vì `HideAuxiliary`.
3. Khi vào Recovery, mở Disk Utility và bật **View → Show All Devices** để nhận diện đúng SSD/container.
4. Nếu dùng một phân vùng macOS đã chuẩn bị trên SSD dùng chung Windows/dữ liệu, chỉ xóa volume/container macOS đã xác nhận. Không xóa thiết bị SSD cha chỉ vì nó chứa phân vùng macOS.
5. Máy nguồn ghi nhận SSD Samsung PM9A1 cho Windows và SSD WD SN810/SN850 cho macOS/dữ liệu. Đây là mô tả máy nguồn, không phải chỉ thị xóa mọi SSD WD. Dung lượng khoảng 400 GiB trong ghi chú nguồn cũng không áp dụng bắt buộc cho người khác.
6. Với SSD dành riêng hoàn toàn cho macOS, có thể chuẩn bị GUID Partition Map và APFS sau khi xác nhận toàn bộ SSD đó có thể xóa. Đặt tên volume dễ nhận như `macOS`.
7. Đóng Disk Utility, chọn Install macOS Sequoia và đúng volume macOS. Recovery tải bộ cài qua Internet; giữ kết nối ổn định.

Trên Windows, nếu cần lấy dung lượng từ ổ đang dùng, chuẩn bị vùng trống bằng Disk Management sau khi lưu dữ liệu. Không dùng lệnh `diskpart clean` hoặc script format tự động của bộ cũ để “tạo USB” khi chưa kiểm tra số ổ đĩa.

## 6. Các lần khởi động lại

Giữ USB cắm suốt quá trình cài. Sau mỗi reboot, tiếp tục chọn UEFI USB rồi chọn **macOS Installer** hoặc mục macOS trên SSD tùy giai đoạn. Không quay lại Recovery và xóa/cài lại từ đầu sau mỗi reboot.

Khi Setup Assistant xuất hiện, tạo tài khoản macOS và hoàn tất đến desktop. Có thể bỏ qua Apple ID lúc này; kiểm tra danh tính và mạng trước khi dùng iServices. Chưa có driver NVIDIA thì desktop có thể chậm, thiếu Metal hoặc độ phân giải chưa đúng.

Đến desktop mới coi giai đoạn cài hệ điều hành đã xong. Không đổi GPU mode giữa các bước installer chưa hoàn tất.

## 7. Cài xong: tắt máy, tắt iGPU, vào lại macOS

1. Chọn Apple menu → **Shut Down**, đợi máy tắt hoàn toàn.
2. Vào BIOS, đổi Hybrid/Switchable Graphics sang **Discrete Graphics / dGPU Only**, tức **tắt iGPU** theo quy trình của máy này. Lưu BIOS.
3. Vẫn boot từ cùng USB và chọn macOS đã cài trên SSD.
4. Giữ profile `installer` để macOS còn dùng framebuffer của firmware trong lần boot trước khi driver NVIDIA được cài.
5. Nếu không có hình sau khi đổi mode, dùng màn hình/đường xuất mà firmware hỗ trợ hoặc quay lại Hybrid để chẩn đoán; không format lại macOS. Xem [khôi phục](TROUBLESHOOTING.md).

## 8. Cài driver NVIDIA

Làm theo [NVIDIA.vi.md](NVIDIA.vi.md): mở 1401 Mac **1.14.0**, xác nhận đúng USB OpenCore đang boot, xem các thay đổi, cài driver, cho phép kext nếu được hỏi rồi restart. App xử lý chuyển cấu hình từ installer sang chạy driver. Gói `.tar.gz` dùng cho cài thủ công đã được mô tả riêng.

Không chép NVRM/NVAccel vào `EFI/OC/Kexts` đồng thời với cài vào macOS. Không rút USB giữa quá trình app sửa EFI và các lần reboot. Không chuyển serial/model SMBIOS sau khi app đã nhận diện máy.

## 9. Kiểm tra sau cài

Chạy trong Terminal:

```sh
system_profiler SPDisplaysDataType
kmutil showloaded --list-only | grep -i nullmoth
csrutil status
```

Kiểm tra đúng RTX 4060 Laptop, mục Metal và kext NVIDIA. Tiếp tục thử độ phân giải, màn hình trong/ngoài, âm thanh, LAN, Wi-Fi/Bluetooth, touchpad, pin và sleep/wake. Ghi rõ từng mục đã thử; chỉ nhìn thấy tên GPU chưa đủ kết luận tăng tốc hoạt động.

Luôn giữ bản EFI installer cá nhân hóa để khôi phục và boot bằng USB cho đến khi đã kiểm tra cấu hình boot nội bộ riêng. Mục “Add OpenCore SSD Boot” trong snapshot không cần dùng cho quy trình USB này.
