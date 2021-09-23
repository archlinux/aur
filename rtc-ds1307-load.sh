#!/bin/bash
#
# Load i2c rtc ds1307 clock boot load script

echo ds1307 0x68 >> /sys/class/i2c-adapter/i2c-2/new_device

