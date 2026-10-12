KAYN — MACOS SEQUOIA / INSTALLATION

ENGLISH — PRIMARY
Read README.en.md and docs/INSTALL.en.md before installing.
The public default uses the installer profile and placeholder SMBIOS values.
Personalize: python scripts/configure.py --identity --profile installer

1. Enable iGPU / Hybrid in BIOS; boot USB and finish macOS installation.
2. Shut down completely.
3. In BIOS disable iGPU / select Discrete Graphics or dGPU Only.
4. Boot installed macOS through the USB, retaining installer profile before driver.
5. Extract NullMoth/current/1401-Mac-1.14.0.zip; run 1401.app on macOS.
6. Verify the actual startup OpenCore USB; install and approve extensions if asked.
7. Restart and verify RTX 4060 Laptop, Metal and loaded driver kexts.

Details and recovery: docs/NVIDIA.en.md, docs/TROUBLESHOOTING.md.
Keep the boot USB attached during app use and restarts.
Recovery needs Internet. Select the macOS volume, not a shared parent SSD.

TIẾNG VIỆT
Đọc README.md và docs/INSTALL.vi.md trước khi cài.
Bản công khai mặc định dùng profile installer và SMBIOS placeholder.
Tạo danh tính riêng: python scripts/configure.py --identity --profile installer

1. Bật iGPU / Hybrid trong BIOS; boot USB và cài macOS đến desktop.
2. Shut Down hoàn toàn.
3. Vào BIOS tắt iGPU / chọn Discrete Graphics hoặc dGPU Only.
4. Boot lại macOS đã cài, vẫn dùng USB và profile installer trước driver.
5. Mở NullMoth/current/1401-Mac-1.14.0.zip, chạy 1401.app trên macOS.
6. Xác nhận đúng USB OpenCore startup; cài driver, cho phép extension nếu hỏi.
7. Restart và kiểm tra RTX 4060 Laptop, Metal, kext đã load.

Chi tiết và gỡ/khôi phục: docs/NVIDIA.vi.md, docs/TROUBLESHOOTING.md.
Giữ USB cắm trong khi app chạy và qua các lần restart.
Recovery cần Internet. Chọn đúng volume macOS; không xóa SSD dùng chung dữ liệu.

Official driver release:
https://github.com/nullmoth/nvidia-macos-driver/releases/tag/v1.14.0
