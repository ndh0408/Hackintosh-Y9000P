# Cài NVIDIA RTX 4060 Laptop bằng NullMoth

[English](NVIDIA.en.md) · [Cài macOS](INSTALL.vi.md) · [Cấu hình](CONFIGURATION.md)

## 1. Đúng thứ tự trước khi chạy app

Hoàn thành cài macOS trong Hybrid/bật iGPU đến desktop. Sau đó **Shut Down hoàn toàn**, vào BIOS **tắt iGPU/chọn Discrete Graphics hoặc dGPU Only**, rồi vào lại macOS bằng cùng USB. Đây là trình tự do chủ máy cung cấp cho Y9000P; máy không có MUX/đường xuất NVIDIA tương ứng cần kiểm tra riêng.

Lần vào macOS trước khi driver tồn tại vẫn dùng profile `installer`. Việc tắt iGPU không tự tạo driver NVIDIA. Chỉ chuyển profile chạy NVIDIA khi đã cài driver và chuẩn bị reboot.

## 2. Dùng 1401 Mac 1.14.0

1. Mở `NullMoth/current/1401-Mac-1.14.0.zip`, giải nén `1401.app` trên macOS, rồi mở app. Có thể tải DMG trực tiếp từ [Release chính thức](https://github.com/nullmoth/nvidia-macos-driver/releases/tag/v1.14.0). Kiểm tra checksum trước khi chạy.
2. **Giữ USB OpenCore đã dùng để boot cắm vào máy.** Xác nhận app chọn đúng phân vùng startup chứa `EFI/OC/config.plist`. Chỉ trùng model SMBIOS chưa đủ xác định đúng USB; nếu app yêu cầu chọn thủ công, chọn theo thiết bị/phân vùng thực tế.
3. Đọc phần kiểm tra và xem trước thay đổi. Dùng chức năng cài/cập nhật NVIDIA driver; tên nút có thể thay đổi theo phiên bản app. Cho phép thao tác quản trị mà installer yêu cầu.
4. Để app cài package và cập nhật EFI đang dùng. Không ghi đè config bằng mẫu khác sau đó vì sẽ mất thay đổi của app và danh tính riêng.
5. Restart vẫn qua USB. Nếu macOS yêu cầu chấp thuận extension, vào **System Settings → Privacy & Security**, cho phép extension rồi restart thêm lần nữa theo thông báo.

Xem [tài liệu 1401/NVIDIA](https://github.com/nullmoth/nvidia-macos-driver/blob/v1.14.0/README.md#1401-mac-app-easiest). Driver mới vẫn cần kiểm tra trên từng laptop; việc RTX 4060 nằm trong họ thiết bị được hỗ trợ không bảo đảm mọi đường xuất hình của máy đã được kiểm chứng.

## 3. Cấu hình nào thay đổi?

| Mục | Trước driver / installer | Sau cài / NVIDIA |
| --- | --- | --- |
| `UEFI/Quirks/ResizeGpuBars` | `-1` | `13` |
| `Booter/Quirks/ResizeAppleGpuBars` | `0` | `-1` |
| Block `com.apple.iokit.IONDRVSupport` | `Enabled=false` | `Enabled=true`, `Strategy=Exclude` |
| `Misc/Security/SecureBootModel` | `Disabled` | `Disabled` |

Giá trị NVIDIA trong bảng khớp snapshot chạy driver của máy nguồn và [cấu hình upstream](https://github.com/nullmoth/nvidia-macos-driver/blob/v1.14.0/README.md#wiring-into-an-existing-opencore-setup). Giá trị BAR `13` tương ứng lựa chọn upstream cho cửa sổ 8 GB; app và firmware phải xác minh điều kiện của máy, không áp dụng hàng loạt cho GPU khác.

Trong NVRAM GUID `7C436110-AB2A-4BBB-A880-FE41995C9F82`:

```text
csr-active-config (Data): 430A0000
boot-args additions:
nvfb=1 nvaccel=1 nvfbheads=4 -nvkmsnosmooth
amfi_get_out_of_my_way=0x1 amfi=0x80 ipc_control_port_options=0
```

Các tham số AMFI/SIP làm giảm một số bảo vệ để tải driver ngoài Apple. Đây là điều kiện có tác động thực tế, không phải nút tối ưu tốc độ. Giữ các boot-args CPU/audio của bộ máy; tránh tự xóa toàn bộ chuỗi. `nv_disable=1` và `agdpmod=pikera` không được dùng cho đường driver này. App cần xử lý các điều kiện và NVRAM tương ứng.

Driver được cài trong macOS và Auxiliary Kernel Collection. **Không chép thêm** các kext NullMoth vào `EFI/OC/Kexts`. Giữ Above 4G Decoding On và CSM Off khi các mục này có trong firmware.

## 4. Cài thủ công bằng package

Đây là đường thay thế khi không dùng app. Chạy từ một thư mục giải nén riêng để không trộn `pkgroot` của các phiên bản. Kiểm tra archive trước:

```sh
cd /Volumes/TEN_USB/NullMoth/current
shasum -a 256 nullmoth-nvidia-1.14.0.tar.gz
```

So sánh với `current/SHA256SUMS.txt`. Chép archive sang một thư mục làm việc trên macOS rồi chạy:

```sh
tar -xzf nullmoth-nvidia-1.14.0.tar.gz
cd pkgroot
shasum -a 256 -c SHA256SUMS
sudo ./install.sh
```

Mỗi dòng kiểm tra nội dung cần báo `OK`. Trước reboot, sửa **config trên đúng USB** để dùng profile NVIDIA, giữ SMBIOS đã cá nhân hóa. Nếu USB có đủ thư mục `scripts`:

```sh
python3 /Volumes/TEN_USB/scripts/configure.py \
  --config /Volumes/TEN_USB/EFI/OC/config.plist --profile nvidia
sudo shutdown -r now
```

Thay `TEN_USB` bằng tên volume thực tế, đặt đường dẫn trong dấu ngoặc kép nếu có khoảng trắng. Helper đặt các giá trị trong bảng và thêm boot-args mới, nhưng không kiểm tra điều kiện BIOS hay tự cài driver. Cho phép extension trong Privacy & Security nếu được hỏi. Xem [cài thủ công upstream](https://github.com/nullmoth/nvidia-macos-driver/blob/v1.14.0/README.md#install--prebuilt-recommended).

## 5. Xác minh sau reboot

```sh
system_profiler SPDisplaysDataType
kmutil showloaded --list-only | grep -i nullmoth
nvram boot-args
csrutil status
```

Đối chiếu RTX 4060 Laptop, VRAM, trạng thái Metal và các kext như NVRM/NVAccel/NVRMFB/NVRMAGDC. Không công khai toàn bộ `nvram -p` hoặc report chưa ẩn serial/UUID/địa chỉ. Thử một ứng dụng Metal, đổi độ phân giải và kiểm tra từng cổng màn hình. Nếu tên GPU có nhưng Metal không được hỗ trợ, tiếp tục chẩn đoán; đừng đánh dấu hoàn tất chỉ từ tên GPU.

Không chỉnh ngay boot-args nếu lần boot đầu dừng một lúc ở `PCI configuration end`; upstream mô tả có khoảng chờ khởi tạo GPU. Nếu đứng kéo dài hoặc lặp panic, dùng đường khôi phục bên dưới thay vì reboot vô hạn.

## 6. Gỡ hoặc khôi phục

Nếu app đã tạo mục **1401: Remove NVIDIA driver** trong OpenCore, chọn mục đó để chạy quy trình gỡ/khôi phục của app. Bản mới còn có mục **1401: Start once without NVIDIA driver** để thử boot một lần không driver; kiểm tra mục thực tế app đã thêm vào EFI.

Với package thủ công, từ `pkgroot` đúng phiên bản và theo hướng dẫn upstream:

```sh
sudo ./uninstall.sh
sudo shutdown -r now
```

Nếu chuyển về profile `installer`, dùng helper trên **config hiện tại** để giữ danh tính, hoặc phục hồi bản config riêng được lưu trước cài. Có thể trở lại Hybrid khi đường xuất hình yêu cầu. Chỉ đổi BAR về installer không đủ gỡ các kext đã cài trên macOS; cần dùng chức năng gỡ/boot an toàn của driver.

## 7. Bản cũ và cập nhật

USB nguồn lưu driver **1.0.11** và app **1.0.18**. Bản **1.14.0** đã được thêm riêng vào `current/`, xác minh theo checksum upstream ngày 2026-10-12. Không cài cả hai package đồng thời. Lưu config đang dùng trước khi cập nhật, xem [release notes](https://github.com/nullmoth/nvidia-macos-driver/releases/tag/v1.14.0) và kiểm tra lại GPU sau reboot.

Các driver thử nghiệm AMD/Intel/NPU trong app mới không thuộc quy trình NVIDIA này; không bật chúng chỉ vì có tùy chọn. Hướng dẫn tập trung Sequoia 15, không tự nâng macOS lên Tahoe.
