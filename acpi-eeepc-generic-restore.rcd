#!/bin/sh
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

. /etc/rc.conf
. /etc/rc.d/functions

. /etc/acpi/eeepc/acpi-eeepc-generic-functions.sh

case "$1" in
    restart|restore|reload|force-reload|start)

        if [ "$RESTORE_BLUETOOTH" = "1" ]; then
            if [ -e "$EEEPC_VAR/states/bluetooth" ]; then
                stat_busy "Restoring EeePC state (bluetooth)..."
                /etc/acpi/eeepc/acpi-eeepc-generic-toggle-bluetooth.sh restore &> /dev/null
                stat_done
            fi
        fi

        if [ "$RESTORE_BRIGHTNESS" = "1" ]; then
            if [ -e "$EEEPC_VAR/states/brightness" ]; then
                stat_busy "Restoring EeePC state (brightness)..."
                restore_brightness
                stat_done
            fi
        fi

        if [ "$RESTORE_TOUCHPAD" = "1" ]; then
            if [ -e "$EEEPC_VAR/states/touchpad" ]; then
                stat_busy "Restoring EeePC state (touchpad)..."
                /etc/acpi/eeepc/acpi-eeepc-generic-toggle-touchpad.sh restore
                stat_done
            fi
        fi

        if [ "$RESTORE_WIFI" = "1" ]; then
            if [ -e "$EEEPC_VAR/states/wlan" ]; then
                stat_busy "Restoring EeePC state (wifi)..."
                /etc/acpi/eeepc/acpi-eeepc-generic-toggle-wifi.sh restore
                stat_done
            fi
        fi

    ;;

    stop)
    ;;
    *)
	    echo "usage: $0 {start}"  
    ;;
esac


exit 0

