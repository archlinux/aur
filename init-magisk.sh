#!/system/bin/sh

sleep 2
magisk --post-fs-data
sleep 1
magisk --service
magisk --boot-complete