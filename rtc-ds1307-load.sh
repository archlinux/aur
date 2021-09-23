#!/bin/bash
#
# Load i2c rtc ds1307 clock boot load script

for i in $(i2cdetect -l | awk '{p=index($1, "-"); print substr($1, p+1)}'); do
    if i2cdetect -y ${i} | grep -q -e "-- -- -- -- -- -- -- -- 68 -- -- -- -- -- -- --" ; then
        echo ds1307 0x68 >> /sys/class/i2c-adapter/i2c-${i}/new_device
    fi
done
