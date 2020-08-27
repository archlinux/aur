#!/bin/bash

# Disable all energy save features, and leave the monitor always on
xset s off         # don't activate screensaver
xset -dpms         # disable DPMS (Energy Star) features.
xset s noblank     # don't blank the video device

# Hide mouse cursor
unclutter -display :0.0 -root &

# Clean old debug logs
rm /home/retroarch/debug.log 2>&1 >&/dev/null

# Autostart Retroarch
exit_code=1
while [ "$exit_code" -ne "0" ]
do
  /usr/bin/retroarch --appendconfig=/etc/retroarch-standalone.cfg -v --log-file /home/retroarch/debug.log
  exit_code=$?
done

if [ -x "/home/retroarch/.xinit_exit" ]
then
  /home/retroarch/.xini_exit
fi

