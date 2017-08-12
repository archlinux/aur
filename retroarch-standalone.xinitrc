#!/bin/bash

# Disable all energy save features, and leave the monitor always on
xset s off         # don't activate screensaver
xset -dpms         # disable DPMS (Energy Star) features.
xset s noblank     # don't blank the video device

# Hide mouse cursor
unclutter -display :0.0 -noevents -grab -root -reset &

# Autostart Retroarch
exec /usr/bin/retroarch --appendconfig=/etc/retroarch-standalone.cfg
