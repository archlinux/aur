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


# Autostart Chromium in Fullscreen mode
exec /usr/bin/chromium --desktop-window-1080p --kiosk "$URL"
