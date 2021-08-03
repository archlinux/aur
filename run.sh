#!/bin/sh

params=""

if [ -n "$WAYLAND_DISPLAY" ]; then
	params="--enable-features=UseOzonePlatform --ozone-platform=wayland"
fi

electron $params /usr/lib/lichobile-electron
