#!/system/bin/sh

mkdir -p /data/adb/magisk
cp /busybox /data/adb/magisk/busybox
cp /util_functions.sh /data/adb/magisk/util_functions.sh
cp /boot_patch.sh /data/adb/magisk/boot_patch.sh
cp /addon.d.sh /data/adb/magisk/addon.d.sh
magisk -c >&2
ln -sf /data /sbin/.magisk/mirror/data
ln -sf /vendor /sbin/.magisk/mirror/vendor
magisk --post-fs-data
sleep 1
magisk --service
magisk --boot-complete