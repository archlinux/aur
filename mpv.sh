#!/bin/bash
source /etc/mpv/default_screen.conf
mpv $1 --script /etc/mpv/xrandr.lua 
xrandr --output $OUTPUT --mode $MODE --rate $RATE