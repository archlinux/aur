#!/bin/sh

/usr/bin/xset s off         # don't activate screensaver
/usr/bin/xset -dpms         # disable DPMS (Energy Star) features.
/usr/bin/xset s noblank     # don't blank the video device

#LOG="/var/log/retroarch/retroarch.log"

#touch "$LOG"
#mv "$LOG" "$LOG.old"

/usr/bin/retroarch #&> "$LOG"

shutdown now
