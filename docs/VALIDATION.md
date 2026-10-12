# Update validation / Kiểm tra bản cập nhật

Ngày / Date: **2026-10-12**.

## Completed / Đã thực hiện

- Sao lưu USB vào Desktop và đối chiếu SHA-256 cho 441 file trước chỉnh sửa. / The original USB backup was checked against its source using SHA-256 for all 441 files before editing.
- Giữ nguyên phân vùng USB nguồn. Bản Kayn được chỉnh trong bản sao. / The source USB was retained; Kayn edits were made in its copy.
- Tên/đường dẫn ACPI cập nhật đồng bộ, 10 bảng ACPI có checksum đúng và độ dài header đúng. / ACPI filenames and references agree; all 10 tables have valid header lengths and checksums.
- OpenCore chỉ thay chuỗi hiển thị trong section `.data`; các section mã và relocation giữ nguyên byte so với snapshot nguồn. / OpenCore edits are confined to display strings in `.data`; code and relocation sections match the source snapshot byte-for-byte.
- itlwm chỉ thay 144 đường dẫn biên dịch trong symbol table debug loại `N_SO`/`N_OSO`; byte ngoài string table không đổi. / itlwm changes affect 144 debug compilation paths in `N_SO`/`N_OSO` entries; bytes outside the string table are unchanged.
- Các file plist công khai parse được. / Public plist files parse successfully.
- Config active, installer, NVIDIA và hai config lưu trữ đều qua `ocvalidate` schema 1.0.3 không lỗi. / The active, installer, NVIDIA and two historical configs pass the 1.0.3 schema validator.
- Các path ACPI, kext, executable, driver và tool trong config active đều có file tương ứng. / Active config references resolve to their ACPI, kext, executable, driver and tool files.
- Danh tính SMBIOS trong file công khai dùng placeholder. SSID và mật khẩu Wi-Fi lưu trong itlwm đã được xóa khỏi bản công khai. / Published SMBIOS fields use placeholders. Saved itlwm SSIDs/passwords were cleared in the public copy.
- App/driver 1.14.0 đối chiếu SHA-256 theo file checksum upstream. / App/driver 1.14.0 SHA-256 values match the upstream checksum file.
- Bản repo và gói Release có manifest SHA-256 để kiểm tra trước cá nhân hóa. / The repository and Release bundles include SHA-256 manifests for verification before personalization.

## Scan scope / Phạm vi quét

Quét tên file và chuỗi trong file thường bằng UTF-8/ASCII, UTF-16 LE/BE; giải nén stream từng file trong ZIP và TAR.GZ để kiểm tra nội dung. Recovery DMG chỉ được quét ở dạng byte container, không mount/giải nén hệ file bên trong. Không có cơ sở tuyên bố đã kiểm tra nội dung hệ file Recovery qua phép quét này.

Filenames and regular file strings were scanned in UTF-8/ASCII and UTF-16 LE/BE. ZIP and TAR.GZ members were streamed uncompressed for inspection. Recovery DMG was scanned as container bytes; its internal filesystem was not mounted or unpacked. This scan therefore does not establish inspection of the Recovery filesystem contents.

Cache/thùng rác/metadata macOS từ bản backup được chuyển ra thư mục cách ly cục bộ, không có trong bản công khai hay Release. / Source backup caches, trash and macOS metadata were moved to a local quarantine and are absent from public files and Release bundles.

## Not performed / Chưa thực hiện

- Chưa reboot máy vào macOS sau chỉnh sửa. / No post-edit macOS boot.
- Chưa cài/thử runtime NullMoth 1.14.0 trên máy nguồn. / No runtime installation/test of 1.14.0 on this machine.
- Chưa đo Metal, sleep, pin, nhiệt, USB, touchpad hoặc mạng/âm thanh. / No Metal, sleep, battery, thermal, USB, touchpad, network or audio qualification.

Kiểm tra schema và hash không thay thế boot test. Hãy ghi kết quả phần cứng sau khi làm theo hướng dẫn, thay vì xem “có file kext” là “hoạt động”. / Schema and hash checks do not replace a boot test. Record actual hardware results rather than equating a bundled kext with working hardware.
