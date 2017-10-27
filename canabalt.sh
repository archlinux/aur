#!/bin/bash

if [ -x /usr/bin/xdotool ] && [ "$1" = "" ]; then
	# Automatically maximize game window if `xdotool` is installed. Use `Alt+F4` to exit.
	xdotool sleep 2 search --name "Adobe Flash Player" windowactivate key Escape &
fi

flashplayer /opt/canabalt/canabalt.swf > /dev/null 2> /dev/null