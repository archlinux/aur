#!/bin/bash
# Copyright 2009 Nicolas Bigaouette
# This file is part of acpi-eeepc-generic.
# http://code.google.com/p/acpi-eeepc-generic/
# 
# acpi-eeepc-generic is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# acpi-eeepc-generic is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with acpi-eeepc-generic.  If not, see <http://www.gnu.org/licenses/>.

. /etc/acpi/eeepc/acpi-eeepc-generic-functions.sh

tmp_xrandr="$EEEPC_VAR/lvds-modes"

if [ -e "$tmp_xrandr" ]; then
    LVDS_XRANDR=$(cat $tmp_xrandr)
else
    LVDS_XRANDR=$(xrandr > $tmp_xrandr)
fi

LVDS_MODES=$(cat $tmp_xrandr | grep -F -e LVDS -A 12 | grep [0-9]x[0-9] | grep -v -e LVDS | awk '{printf $1" "}')
LVDS_CURRENT=$(cat $tmp_xrandr | grep -F -e LVDS -A 12 | grep -F -e [0-9]x[0-9] -e "*" | awk '{print $1}')

function toggle_resolution {
    for mode in $LVDS_MODES $LVDS_MODES; do
        if [ "$mode" = "$LVDS_CURRENT" ]; then
            NEXT=1;
        elif [ "$NEXT" = "1" ]; then
            xrandr -s $mode
            eeepc_notify "Changing resolution to \"$mode\"" video-display
            echo $mode > $EEEPC_VAR/resolution_saved
            exit
        fi
    done
}

function restore_resolution {
    if [ -e "$EEEPC_VAR/resolution_saved" ]; then
        RESOLUTION=$(cat $EEEPC_VAR/resolution_saved)
        xrandr -s $RESOLUTION
        eeepc_notify "Changing resolution back to \"$RESOLUTION\"" video-display
    fi
}

case $1 in
    restore)
        restore_resolution
    ;;
    *)
        toggle_resolution
    ;;
esac
