# Troubleshooting and recovery / Lỗi và khôi phục

| Dấu hiệu / Symptom | Kiểm tra tiếng Việt | English checks |
| --- | --- | --- |
| USB không có trong boot menu / USB absent | GPT/UEFI, FAT32, `EFI/BOOT/BOOTx64.efi` ở gốc; thử cổng USB khác | Check GPT/UEFI, FAT32 and the root fallback boot path; try another USB port |
| Không thấy Recovery / Recovery absent | Nhấn Space, kiểm tra cặp BaseSystem.dmg/chunklist đúng thư mục | Press Space; check the BaseSystem pair under `com.apple.recovery.boot` |
| Recovery không tải macOS / Download fails | Dùng LAN, kiểm tra kết nối và thời gian; không suy đoán Wi-Fi hoạt động chỉ vì có itlwm | Use Ethernet, check connectivity and clock; bundled itlwm does not establish working Wi-Fi |
| Reboot vào Windows giữa cài / Installer restart enters Windows | Chọn lại UEFI USB rồi macOS Installer/macOS SSD | Boot UEFI USB and select the relevant macOS Installer/SSD entry |
| Đen màn sau khi tắt iGPU / Black after disabling iGPU | Giữ installer profile trước driver; kiểm tra dGPU output/MUX, có thể trở về Hybrid để chẩn đoán | Retain installer profile before driver installation; check dGPU/MUX routing and return to Hybrid for diagnosis if needed |
| App không nhận đúng EFI / Wrong EFI selected | Giữ USB startup cắm, xác nhận đúng phân vùng bằng tên/thiết bị; trùng SMBIOS chưa đủ | Keep the startup USB connected; verify the actual partition/device, not just a matching SMBIOS |
| GPU có tên nhưng chưa có Metal / GPU named but no Metal | Kiểm tra kext loaded, extension approval, phiên bản, boot-args, config startup | Check loaded kexts, approval, versions, boot arguments and the actual startup config |
| Nhấp nháy hoặc lỗi sau driver / Driver flicker or failures | Thu log bằng app theo lựa chọn của bạn, đọc release notes, thử đường safe-start/remove | Collect app diagnostics if you choose, read release notes and try safe-start/remove |
| Touchpad/USB không đúng / Touchpad or USB issues | So sánh phần cứng và USB map với máy nguồn; không bật toàn bộ kext dự phòng | Compare hardware and port mapping with the source machine; do not enable every fallback kext |
| Wi-Fi/Bluetooth/audio không chạy / Network or audio fails | Đây là mục chưa kiểm chứng; kiểm tra ID, phiên bản kext, layout và log | These remain unverified; check device IDs, kext versions, audio layout and logs |

## When macOS cannot boot / Khi không vào được macOS

1. Lưu ảnh/log đoạn lỗi cuối và ghi graphics mode, profile, driver version. / Record the final error, graphics mode, profile and driver version.
2. Thử mục 1401 safe-start hoặc remove nếu app đã tạo; nhấn Space để hiện mục phụ. / Try the 1401 safe-start/remove entry if installed; press Space for auxiliary entries.
3. Dùng Windows/máy khác để sửa đúng USB. Phục hồi config cá nhân trước cài từ `.local-backups` hoặc backup app. / Use Windows/another computer to edit the correct USB and restore a personal pre-install config from `.local-backups` or the app's backup.
4. Nếu dùng helper chuyển về installer, giữ serial/MLB/UUID/ROM đang có. / If switching with the helper, retain the current serial/MLB/UUID/ROM.
5. Trở lại Hybrid khi cần đường hình của firmware. Đổi BAR không tự gỡ driver nằm trên macOS. / Return to Hybrid when firmware display routing requires it. BAR changes alone do not uninstall macOS driver kexts.
6. Không xóa SSD hoặc cài lại Windows chỉ vì EFI/driver đang lỗi. / EFI/driver failure does not require erasing the SSD or reinstalling Windows.

## NVRAM

Chỉ dùng Reset NVRAM khi đã xác định giá trị cũ không được cập nhật và đã lưu thiết lập boot. Reset có thể đổi thứ tự boot; sau đó dùng boot menu chọn lại USB. Không lặp reset như bước bắt buộc cho mọi lỗi.

Use Reset NVRAM when stale values have been identified and boot settings are recorded. It may affect boot order; select the USB from the firmware menu afterward. Repeated resets are not a universal repair.

## Logs and updates / Nhật ký và cập nhật

`system_profiler SPDisplaysDataType`, `kmutil showloaded --list-only`, boot-args và app diagnostics giúp xác định lớp lỗi. Ẩn danh tính và địa chỉ trước khi công khai log. App có chức năng gửi log; việc gửi là quyết định của người dùng, không cần tự động gửi để làm theo hướng dẫn này.

Display reports, loaded-kext output, boot arguments and app diagnostics identify the failing layer. Redact identities and addresses before publishing logs. Sending diagnostics is the user's choice, not an automatic prerequisite of this guide.

Theo dõi [upstream issues](https://github.com/nullmoth/nvidia-macos-driver/issues) và [release notes 1.14.0](https://github.com/nullmoth/nvidia-macos-driver/releases/tag/v1.14.0). Bản upstream có thể thay đổi; lưu phiên bản và checksum đã dùng thay vì trộn các file của nhiều bản.

Consult [upstream issues](https://github.com/nullmoth/nvidia-macos-driver/issues) and [1.14.0 release notes](https://github.com/nullmoth/nvidia-macos-driver/releases/tag/v1.14.0). Keep the version/checksum you installed rather than mixing files from different releases.
