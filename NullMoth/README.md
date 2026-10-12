# NullMoth packages / Các gói NullMoth

## English

The full USB Release contains the original `1401-Mac-1.0.18.zip` and `nullmoth-nvidia-1.0.11.tar.gz`, plus `current/1401-Mac-1.14.0.zip` and `current/nullmoth-nvidia-1.14.0.tar.gz` with their upstream checksum file. Use the current pair for the documented new installation; keep the archived pair as a historical reference, not as a second driver to install simultaneously.

The ordinary Git checkout contains this document and a hardware profile. Download installers from this project's full Release or the [official NullMoth release](https://github.com/nullmoth/nvidia-macos-driver/releases/tag/v1.14.0). The [upstream README](https://github.com/nullmoth/nvidia-macos-driver/blob/v1.14.0/README.md) describes requirements and installation. Follow [our NVIDIA guide](../docs/NVIDIA.en.md) for this laptop's BIOS sequence.

`system-profile.json` records detected hardware and the published EFI hashes. Its `qualification` fields explicitly distinguish detection from verified runtime operation. The SMBIOS model remains `MacBookPro16,2`; the upstream example `iMacPro1,1` is not silently substituted.

## Tiếng Việt

Release USB đầy đủ giữ lại `1401-Mac-1.0.18.zip` và `nullmoth-nvidia-1.0.11.tar.gz`, đồng thời thêm `current/1401-Mac-1.14.0.zip`, `current/nullmoth-nvidia-1.14.0.tar.gz` và file checksum từ upstream. Dùng cặp mới cho hướng dẫn cài mới; cặp cũ chỉ là bản lưu lịch sử, không cài chồng hai driver cùng lúc.

Bản clone Git chỉ chứa tài liệu này và profile phần cứng. Tải bộ cài từ Release đầy đủ của dự án hoặc [Release chính thức NullMoth](https://github.com/nullmoth/nvidia-macos-driver/releases/tag/v1.14.0). [README upstream](https://github.com/nullmoth/nvidia-macos-driver/blob/v1.14.0/README.md) nêu yêu cầu và cách cài. Xem [hướng dẫn NVIDIA của dự án](../docs/NVIDIA.vi.md) để làm đúng trình tự BIOS trên laptop này.

`system-profile.json` ghi phần cứng được phát hiện và hash EFI công khai. Các trường `qualification` phân biệt phát hiện phần cứng với hoạt động đã kiểm chứng. Mẫu SMBIOS vẫn là `MacBookPro16,2`; dự án không tự đổi sang `iMacPro1,1` của ví dụ upstream.
