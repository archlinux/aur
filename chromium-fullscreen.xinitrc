#!/bin/bash

# The URL variuabile where we will store the final address to open
URL=''

# This is usually the case of a Raspberry Pi-like installation ( arm platforms )
if [ -f "/boot/chromium-autostart-url.txt" ]; then
  URL=`cat /boot/chromium-autostart-url.txt`
# This is probably the case of generic setups on x86 platforms
elif [ -f "/home/chromium/chromium-autostart-url.txt" ]; then
  URL=`cat /home/chromium/chromium-autostart-url.txt`
fi

# Disable all energy save features, and leave the monitor always on
xset s off         # don't activate screensaver
xset -dpms         # disable DPMS (Energy Star) features.
xset s noblank     # don't blank the video device

# Hide mouse cursor
unclutter -display :0.0 -noevents -grab -root -reset &

# Clear cache and config before starting the process
rm -Rf .cache .config

# Autostart Chromium in Fullscreen mode
exec /usr/bin/chromium --disable \
    --no-first-run \
    --disable-translate \
    --disable-infobars \
    --disable-suggestions-service \
    --disable-save-password-bubble \
    --disable-session-crashed-bubble \
    --load-extension=.extensions/disable-x-frame-option \
    --window-position="0,0" \
    --window-size="1920,1080" \
    --kiosk "$URL"
