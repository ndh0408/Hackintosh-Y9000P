@echo -off
map -r
echo Adding OpenCore SSD boot entry. Windows Boot Manager is preserved.
if exist fs0:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs0:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs0:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs0:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs0:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs1:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs1:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs1:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs1:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs1:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs2:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs2:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs2:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs2:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs2:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs3:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs3:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs3:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs3:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs3:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs4:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs4:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs4:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs4:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs4:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs5:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs5:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs5:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs5:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs5:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs6:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs6:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs6:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs6:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs6:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs7:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs7:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs7:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs7:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs7:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs8:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs8:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs8:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs8:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs8:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs9:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs9:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs9:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs9:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs9:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs10:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs10:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs10:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs10:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs10:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs11:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs11:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs11:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs11:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs11:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs12:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs12:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs12:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs12:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs12:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs13:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs13:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs13:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs13:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs13:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs14:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs14:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs14:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs14:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs14:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs15:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs15:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs15:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs15:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs15:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs16:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs16:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs16:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs16:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs16:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs17:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs17:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs17:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs17:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs17:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs18:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs18:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs18:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs18:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs18:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs19:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs19:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs19:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs19:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs19:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs20:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs20:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs20:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs20:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs20:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs21:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs21:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs21:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs21:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs21:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs22:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs22:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs22:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs22:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs22:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs23:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs23:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs23:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs23:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs23:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs24:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs24:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs24:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs24:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs24:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs25:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs25:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs25:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs25:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs25:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs26:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs26:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs26:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs26:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs26:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs27:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs27:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs27:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs27:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs27:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs28:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs28:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs28:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs28:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs28:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs29:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs29:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs29:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs29:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs29:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs30:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs30:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs30:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs30:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs30:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs31:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs31:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs31:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs31:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs31:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs32:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs32:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs32:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs32:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs32:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs33:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs33:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs33:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs33:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs33:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs34:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs34:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs34:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs34:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs34:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs35:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs35:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs35:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs35:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs35:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs36:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs36:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs36:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs36:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs36:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs37:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs37:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs37:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs37:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs37:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs38:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs38:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs38:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs38:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs38:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs39:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs39:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs39:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs39:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs39:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs40:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs40:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs40:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs40:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs40:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs41:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs41:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs41:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs41:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs41:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs42:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs42:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs42:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs42:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs42:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs43:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs43:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs43:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs43:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs43:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs44:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs44:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs44:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs44:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs44:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs45:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs45:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs45:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs45:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs45:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs46:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs46:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs46:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs46:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs46:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs47:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs47:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs47:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs47:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs47:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs48:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs48:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs48:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs48:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs48:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs49:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs49:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs49:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs49:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs49:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs50:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs50:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs50:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs50:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs50:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs51:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs51:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs51:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs51:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs51:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs52:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs52:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs52:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs52:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs52:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs53:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs53:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs53:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs53:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs53:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs54:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs54:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs54:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs54:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs54:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs55:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs55:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs55:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs55:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs55:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs56:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs56:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs56:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs56:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs56:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs57:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs57:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs57:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs57:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs57:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs58:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs58:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs58:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs58:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs58:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs59:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs59:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs59:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs59:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs59:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs60:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs60:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs60:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs60:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs60:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs61:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs61:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs61:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs61:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs61:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs62:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs62:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs62:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs62:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs62:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
if exist fs63:\EFI\OC\kayn-internal-efi-EDC7CB0A.tag then
  if exist fs63:\EFI\OC\OpenCore.efi then
    bcfg boot dump -v > fs63:\EFI\OC\boot-options-before.txt
    bcfg boot addp 0 fs63:\EFI\OC\OpenCore.efi "OpenCore SSD"
    if %lasterror% == 0 then
      echo SUCCESS: OpenCore SSD boot entry was added.
      echo Shut down, unplug USB, then select OpenCore SSD in BIOS.
    else
      echo ERROR: boot entry could not be added. Keep using the USB.
    endif
    bcfg boot dump -v > fs63:\EFI\OC\boot-options-after.txt
    bcfg boot dump
    pause
    exit
  endif
endif
echo ERROR: internal EFI marker was not found. No boot entry was changed.
pause
exit
