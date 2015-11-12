#!/bin/bash
source /etc/mpv-plugin-xrandr/default_screen.conf
(mpv $1 --script /etc/mpv-plugin-xrandr/xrandr.lua; xrandr --output $OUTPUT --mode $MODE --rate $RATE)