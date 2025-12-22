#!/vendor/bin/sh
# added for checking whether if last normal-boot (after ota) finished or not      01/15/2019@chenyuqin
/vendor/bin/dd if=/dev/zero of=/dev/block/bootdevice/by-name/reserved bs=1 count=8 seek=3672072 conv=notrunc && log -t recovery "succeeded to clear last-normal-boot-retry-count" || log -t recovery "failed to clear last-normal-boot-retry-count"
/vendor/bin/dd if=/dev/zero of=/dev/block/bootdevice/by-name/reserved bs=1 count=8 seek=3672088 conv=notrunc && log -t recovery "succeeded to clear last-ota-to-boot-retry-count" || log -t recovery "failed to clear last-ota-to-boot-retry-count"
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery$(getprop ro.boot.slot_suffix):100663296:af50175c599efafe46894cbaac9f0c812c471b56; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot$(getprop ro.boot.slot_suffix):100663296:4a31518ad972f76de61d699e62fbef675ee189aa \
          --target EMMC:/dev/block/bootdevice/by-name/recovery$(getprop ro.boot.slot_suffix):100663296:af50175c599efafe46894cbaac9f0c812c471b56 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
