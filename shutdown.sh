#!/bin/bash

#Run through shutdown-hooks
for file in /usr/lib/vdr/shutdown-hooks/*; do
  if [ -x $file ]; then
    MESSAGE=$($file)
    if [ $? != '0' ]; then
      MESSAGE=$(echo "$MESSAGE" | sed -rn '0,/ABORT_MESSAGE/s/^ABORT_MESSAGE="?([^"]+).*/\1/p')
      svdrpsend MESG "$MESSAGE"
      exit 1
    fi
  fi
done

#Sync back system time to hardware time (Maybe VDR has changed it)
hwclock --systohc --utc

#Unset previous timer
echo '0' > /sys/class/rtc/rtc0/wakealarm

#Set new timer 5mins before recording starts
echo $(($1 - 300 )) > /sys/class/rtc/rtc0/wakealarm

#Initiate shutdown
systemctl poweroff
