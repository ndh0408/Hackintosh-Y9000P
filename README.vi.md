# Kayn — Hackintosh Lenovo Legion Y9000P IRX9

[English — ngôn ngữ chính](README.md)

Bộ EFI đầy đủ cho macOS Sequoia 15, i9-14900HX và NVIDIA RTX 4060 Laptop, lấy từ USB của Kayn ngày 2026-10-12. Có cấu hình cài mới và chạy NVIDIA riêng, scripts chuẩn bị danh tính/kiểm tra file và hướng dẫn chi tiết.

## Trình tự cài

1. Bật iGPU/Hybrid; boot USB bằng profile installer, cài macOS đến desktop.
2. Shut Down hoàn toàn.
3. Vào BIOS tắt iGPU/chọn Discrete Graphics hoặc dGPU Only.
4. Vào lại macOS từ cùng USB, vẫn giữ profile installer trước khi driver tồn tại.
5. Cài NVIDIA bằng 1401 Mac; giữ USB startup cắm và xác nhận đúng phân vùng EFI.
6. Restart, cho phép extension nếu được hỏi, kiểm tra RTX 4060 và Metal.

Đây là quy trình BIOS do chủ máy cung cấp. Bật iGPU khi cài phục vụ đường xuất hình của firmware, không xác nhận Intel UHD Raptor Lake-HX có Metal.

## Tải và chuẩn bị

[Release](https://github.com/ndh0408/Hackintosh-Y9000P/releases) có gói EFI (~31 MB), bộ USB đầy đủ (~1,57 GB) và SHA256SUMS.txt. Bộ đầy đủ thêm Apple Recovery, app/driver nguồn 1.0.18/1.0.11 và các asset mới 1.14.0. Recovery vẫn cần Internet; không phải installer macOS offline hoàn chỉnh.

Các config công khai dùng placeholder SMBIOS. Mạng/mật khẩu Wi-Fi lưu sẵn đã được xóa. Tạo Serial/MLB đúng mẫu MacBookPro16,2 bằng [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS), UUID riêng và ROM từ MAC Ethernet của chính máy, rồi chạy:

```sh
python scripts/verify.py --allow-placeholders --hashes
python scripts/configure.py --identity --profile installer
python scripts/verify.py
```

Hash dùng kiểm tra trước cá nhân hóa. Không đăng config riêng hoặc thư mục .local-backups. Sau khi chuẩn bị, chép nội dung thư mục bao ngoài ZIP ra gốc USB FAT32 để có EFI/BOOT/BOOTx64.efi và com.apple.recovery.boot/BaseSystem.dmg.

## Hướng dẫn

- [Cài macOS, chuẩn bị USB và BIOS](docs/INSTALL.vi.md)
- [Tắt iGPU, cài NVIDIA, xác minh và gỡ driver](docs/NVIDIA.vi.md)
- [Phần cứng và trạng thái](docs/HARDWARE.md)
- [Giá trị cấu hình](docs/CONFIGURATION.md)
- [Chẩn đoán và khôi phục](docs/TROUBLESHOOTING.md)
- [Kiểm tra đã thực hiện](docs/VALIDATION.md)
- [Nguồn và tác giả phần mềm](THIRD_PARTY.md)

## Trạng thái

Bản công khai mặc định installer: ResizeGpuBars=-1, ResizeAppleGpuBars=0, IONDRVSupport block=false. Sau cài NVIDIA: 13/-1 và block=true/Exclude. App 1401 xử lý chuyển cấu hình; helper dùng cho chuyển thủ công, giữ danh tính và bản vá phần cứng.

Driver/app mới 1.14.0 được đối chiếu [Release chính thức](https://github.com/nullmoth/nvidia-macos-driver/releases/tag/v1.14.0) ngày 2026-10-12. Không cài chồng cùng bản driver lưu trữ cũ.

Giữ binary OpenCore tùy biến từ USB; chưa xác định chắc release upstream. Các config công khai qua validator schema 1.0.3. Chủ máy báo từng boot và nhận RTX 4060; bản sửa này và runtime 1.14.0 chưa được boot-test trên máy. Metal, sleep, Wi-Fi/Bluetooth, audio và USB cần kiểm tra thực tế.

Kayn quản lý cấu hình/tài liệu; OpenCore, kext và driver thuộc các tác giả tương ứng.
