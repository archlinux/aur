#!/bin/bash
# /usr/bin/blurlock

# take screenshot
import -window root /tmp/screenshot.png

# blur it
convert /tmp/screenshot.png -blur 0x5 /tmp/screenshotblur.png
rm /tmp/screenshot.png

# lock the screen
i3lock -i /tmp/screenshotblur.png

# sleep 1 adds a small delay to prevent possible race conditions with suspend
sleep 1

exit 0
