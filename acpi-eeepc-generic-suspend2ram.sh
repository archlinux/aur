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

. /etc/acpi/eeepc/acpi-eeepc-generic-functions.sh

# Make sure we run as root
if [[ $EUID -ne 0 ]]; then
   me="`dirname $0`/`basename $0`"
   ${SUDO} "${me}" ${@}
   exit 1
fi

logger "#############################################"
logger "acpi-eeepc-generic-suspend2ram.sh:"

if [ -e "${EEEPC_VAR}/power.lock" ]; then
    msg="Suspend lock exist, canceling suspend"
    logger "$msg (${EEEPC_VAR}/power.lock)"
    eeepc_notify "$msg" stop 5000
    exit 0
fi

vga_is_on=`xrandr | grep -A 1 VGA | grep "*"`
if [ "x$vga_is_on" != "x" ]; then
    msg="VGA is up and running, canceling suspend"
    logger $msg
    eeepc_notify "$msg" stop 5000
    exit 0
fi

if grep -q mem /sys/power/state ; then

    # BEGIN SUSPEND SEQUENCE

    logger "Start suspend sequence"

    if [[ "$SUSPEND_QUIRKS_VTSWITCH" == "yes" ]]; then
        # Get console number
        CONSOLE_NUMBER=$(fgconsole)
        logger "Saving console number: $CONSOLE_NUMBER"

        # Turn off external monitor
        var_xrandr="$EEEPC_VAR/xrandr.log"
        xrandr > $var_xrandr
        name_lvds=$(grep -i connected $var_xrandr | grep -i lvds | awk '{print ""$1""}')
        if [ "x`grep " connected " $var_xrandr | awk '{print ""$1""}' | grep -i VGA`" != "x" ]; then
            name_vga=$(grep -i connected $var_xrandr | grep -i vga | awk '{print ""$1""}')
            xrandr --output ${name_lvds} --preferred --output ${name_vga} --off
        fi

        # Change virtual terminal to not screw up X
        chvt 1
    fi

    # Save logs
    /etc/rc.d/logsbackup stop

    # Flush disk buffers
    sync

    # Suspend
    execute_commands "${SUSPEND2RAM_COMMANDS[@]}"

    logger "BEGIN WAKEUP SEQUENCE..."

    # Restore screen
    #/usr/sbin/vbetool post

    if [[ "$SUSPEND_QUIRKS_VTSWITCH" == "yes" ]]; then
        # Get back to screen
        chvt $CONSOLE_NUMBER
    fi

    # Restore brightness
    restore_brightness

fi

exit 0

