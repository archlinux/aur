#!/usr/bin/env sh

xset s off         # don't activate screensaver
xset -dpms         # disable DPMS (Energy Star) features.
xset s noblank     # don't blank the video device

#LOG="/var/log/retroarch/retroarch.log"

#touch "$LOG"
#mv "$LOG" "$LOG.old"

[ -f '/etc/retroarch-session/pre-launch' ] && . '/etc/retroarch-session/pre-launch'

retroarch #&> "$LOG"

#shutdown now
[ -f '/etc/retroarch-session/post-launch' ] && . '/etc/retroarch-session/post-launch'
