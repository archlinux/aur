#!/bin/bash
board_name=""
if [ -f "/sys/class/dmi/id/board_name" ]; then
    board_name="$(cat /sys/class/dmi/id/board_name)"
fi

if [ "GXxHRXx" = "$board_name" ] || [ "GM5IXxA" = "$board_name" ]; then
    cp Kbuild_no_aspm Kbuild
else
    cp Kbuild_default Kbuild
fi
