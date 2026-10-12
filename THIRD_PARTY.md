# Third-party components / Thành phần bên thứ ba

Kayn cá nhân hóa cấu hình và viết hướng dẫn. Tên dự án không thay đổi quyền tác giả/giấy phép của OpenCore, kext, app hay firmware. / Kayn personalizes the configuration and maintains the guides. Project naming does not change the authorship or licenses of OpenCore, kexts, applications or firmware.

| Thành phần / Component | Nguồn / Source |
| --- | --- |
| OpenCore, OpenRuntime, OpenCanopy, ResetNvramEntry | [Acidanthera OpenCorePkg](https://github.com/acidanthera/OpenCorePkg) |
| Lilu | [Acidanthera Lilu](https://github.com/acidanthera/Lilu) |
| WhateverGreen | [Acidanthera WhateverGreen](https://github.com/acidanthera/WhateverGreen) |
| AppleALC | [Acidanthera AppleALC](https://github.com/acidanthera/AppleALC) |
| VirtualSMC and sensor plugins | [Acidanthera VirtualSMC](https://github.com/acidanthera/VirtualSMC) |
| NVMeFix | [Acidanthera NVMeFix](https://github.com/acidanthera/NVMeFix) |
| RestrictEvents | [Acidanthera RestrictEvents](https://github.com/acidanthera/RestrictEvents) |
| VoodooPS2Controller | [Acidanthera VoodooPS2](https://github.com/acidanthera/VoodooPS2) |
| VoodooI2C / VoodooI2CHID | [VoodooI2C](https://github.com/VoodooI2C/VoodooI2C) |
| VoodooI2C-RPL-GPIO build | Custom source snapshot; exact fork/build not conclusively recorded |
| itlwm | [OpenIntelWireless itlwm](https://github.com/OpenIntelWireless/itlwm) |
| IntelBluetoothFirmware / IntelBTPatcher / BlueToolFixup | [OpenIntelWireless IntelBluetoothFirmware](https://github.com/OpenIntelWireless/IntelBluetoothFirmware) |
| USBToolBox / UTBMap | [USBToolBox](https://github.com/USBToolBox) and source machine port map |
| ECEnabler | [ECEnabler](https://github.com/1Revenger1/ECEnabler) |
| CpuTopologyRebuild | [CpuTopologyRebuild](https://github.com/b00t0x/CpuTopologyRebuild) |
| CpuTscSync | [CpuTscSync](https://github.com/acidanthera/CpuTscSync) |
| RealtekRTL8111 | [Mieze RTL8111](https://github.com/Mieze/RTL8111_driver_for_OS_X) |
| YogaSMC | [YogaSMC](https://github.com/zhen-zen/YogaSMC) |
| NVIDIA driver / 1401 Mac | [NullMoth NVIDIA driver](https://github.com/nullmoth/nvidia-macos-driver) |
| 1401 Windows / USB tooling | [NullMoth 1401](https://github.com/nullmoth/1401) |
| SMBIOS helper upstream | [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS) |
| Apple Recovery and macOS | Apple; unchanged Recovery files from the user's source USB |

Các link upstream chỉ ra tác giả và nơi lấy source/license, không xác nhận các binary tùy biến đều trùng release upstream. / Upstream links identify authors and source/license locations; they do not assert that every retained custom binary is identical to an upstream release.

Các package NullMoth được giữ nguyên byte và checksum. Xem LICENSE/NOTICE của [NullMoth](https://github.com/nullmoth/nvidia-macos-driver/blob/v1.14.0/LICENSE) và [NOTICE](https://github.com/nullmoth/nvidia-macos-driver/blob/v1.14.0/NOTICE), cùng các license thành phần trong package. Dự án không gán giấy phép của tài liệu Kayn cho toàn bộ driver/kext bên thứ ba.

NullMoth packages retain their exact bytes and checksums. Consult upstream [LICENSE](https://github.com/nullmoth/nvidia-macos-driver/blob/v1.14.0/LICENSE), [NOTICE](https://github.com/nullmoth/nvidia-macos-driver/blob/v1.14.0/NOTICE) and bundled component licenses. A license for Kayn's documentation does not replace third-party software licenses.

## Snapshot binary edits / Chỉnh sửa binary trong snapshot

Chỉ chỉnh chuỗi hiển thị OpenCore và đường dẫn source debug của itlwm; không đổi mã thực thi. Bảng ACPI tùy chọn được đổi tên/metadata, chuỗi mô tả và định danh tùy biến, rồi tính lại checksum. Cấu hình công khai còn xóa mật khẩu Wi-Fi và thay danh tính bằng placeholder.

Only OpenCore display strings and itlwm debug source paths were edited; executable code was unchanged. The optional ACPI table's filename, metadata, descriptions and custom identifiers were updated, and its checksum recomputed. Public configurations additionally clear Wi-Fi credentials and use identity placeholders.
