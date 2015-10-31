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

# Make sure we run as root
if [[ $EUID -ne 0 ]]; then
   me="`dirname $0`/`basename $0`"
   ${SUDO} "${me}" ${@}
   exit 1
fi

# 0 means off, 1 means on
STATE_FILE="$EEEPC_VAR/states/touchpad"
LED_FILE="${sys_path}/leds/eeepc::touchpad/brightness"

if [ -e "$STATE_FILE" ]; then
  TPSAVED=$(cat $STATE_FILE)
fi

enable=`synclient -l 2>&1`
if [ "$enable" == "Can't access shared memory area. SHMConfig disabled?" ]; then
    eeepc_notify "$enable" stop 10000
    eeepc_notify "Ensure xorg.conf is properly configured." stop 10000
    exit 1
fi

function touchpad_toggle() {
    if [ -S /tmp/.X11-unix/X0 ]; then
        TOUCHPAD_OFF=`synclient -l | grep TouchpadOff | awk '{print $3}'`
        if [ "$TOUCHPAD_OFF" = "0" ]; then
            echo 0 > $STATE_FILE
            synclient TouchpadOff=1
            if [ $? ]; then
                [ -e /usr/bin/unclutter ] && unclutter -idle 2 -root &
                # Verify if touchpad led exist before trying to turn it off
                [[ -e "${LED_FILE}" ]] && echo 0 > ${LED_FILE}
                eeepc_notify "Touchpad Disabled" mouse
            else
                eeepc_notify "Unable to disable touchpad; Ensure xorg.conf is properly configured." stop
            fi
        else
            echo 1 > $STATE_FILE
            synclient TouchpadOff=0
            if [ $? ]; then
                pkill unclutter
                # Verify if touchpad led exist before trying to turn it on
                [[ -e "${LED_FILE}" ]] && echo 1 > ${LED_FILE}
                eeepc_notify "Touchpad Enabled" mouse
            else
                eeepc_notify "Unable to enable touchpad; Ensure xorg.conf is properly configured." stop
            fi
        fi
    fi
}

function touchpad_restore() {
    if [ "$TPSAVED" = "0" ]; then
        synclient TouchpadOff=1
    else
        synclient TouchpadOff=0
    fi
}

case $1 in
    restore)
        touchpad_restore
    ;;
    *)
        touchpad_toggle
    ;;
esac

