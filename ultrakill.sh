#!/bin/sh

cd /usr/share/ultrakill/game || exit

export LC_ALL=C

LAUNCHER=$(zenity --list \
        --radiolist \
        --text "Please select render to be used:" \
        --title="ULTRAKILL" \
        --column 'Pick' \
        --column 'Play with' \
        FALSE "Vulkan" \
        FALSE "OpenGL"
)

if [ "$LAUNCHER" = "Vulkan" ]; then
	exec ./ULTRAKILL.x86_64 -force-vulkan "$@"
elif [ "$LAUNCHER" = "OpenGL" ]; then
	exec ./ULTRAKILL.x86_64 -force-glcore "$@"
else
	exit 0
fi
