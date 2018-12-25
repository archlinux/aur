#!/bin/bash

#Sync back system time to hardware time (Maybe VDR has changed it)
hwclock --systohc --utc

#Unset previous timer
echo '0' > /sys/class/rtc/rtc0/wakealarm

#Set new timer
echo "$1" > /sys/class/rtc/rtc0/wakealarm

#Log success to journal
echo "Set wakeup time to timestamp $1" | logger -t kodi-setwakeup
