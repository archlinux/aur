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
get_model
. /etc/acpi/eeepc/models/acpi-eeepc-defaults-events.conf
. /etc/acpi/eeepc/models/acpi-eeepc-$EEEPC_MODEL-events.conf

SELECTION=$3
if [ "$KEY_SHOW" = "1" ]; then
eeepc_notify "The event of the pressed key is: \"$SELECTION\"" keyboard 20000
fi

case "$1" in

    battery|processor)
        # Don't do anything
    ;;

    ac_adapter)
        case "$4" in
            00000000) # AC unplugged
                # These events are generated twice (at least on the 1000)
                # Make sure the commands are executed only once
                if [ ! -e ${EEEPC_VAR}/ac_event_unplugged ]; then
                    touch ${EEEPC_VAR}/ac_event_unplugged
                    # Wait 5 seconds (in background) before deleting the file
                    echo `sleep 5 && rm -f ${EEEPC_VAR}/ac_event_unplugged` &
                    execute_commands "${COMMANDS_AC_UNPLUGGED[@]}"
                fi
            ;;
            00000001) # AC plugged-in
                # These events are generated twice (at least on the 1000)
                # Make sure the commands are executed only once
                if [ ! -e ${EEEPC_VAR}/ac_event_plugged ]; then
                    touch ${EEEPC_VAR}/ac_event_plugged
                    # Wait 5 seconds (in background) before deleting the file
                    echo `sleep 5 && rm -f ${EEEPC_VAR}/ac_event_plugged` &
                    execute_commands "${COMMANDS_AC_PLUGGED[@]}"
                fi
            ;;
            *)
                msg="acpi-eeepc-generic-handler: undefined 'ac_adapter' event: $2 $3 $4"
                logger "$msg"
            ;;
        esac
    ;;

    button/power)
        case "$2" in
            PWRF|PBTN)
                eeepc_notify "Power button pressed" gnome-session-halt
                execute_commands "${COMMANDS_POWER_BUTTON[@]}"
            ;;
            *)
                msg="acpi-eeepc-generic-handler: undefined 'button/power' event: $2 $3 $4"
                eeepc_notify "$msg" keyboard
            ;;
        esac
    ;;

    button/sleep)
        case "$2" in
            SLPB|SBTN)
                suspend_check_blacklisted_processes "${SUSPEND_BLACKLISTED_PROCESSES[@]}"
                if [ -e "${EEEPC_VAR}/power.lock" ]; then
                    msg="Suspend lock exist, canceling suspend"
                    logger "$msg (${EEEPC_VAR}/power.lock)"
                    eeepc_notify "$msg" stop 5000
                    exit 0
                fi
                eeepc_notify "Sleep button pressed" gnome-session-suspend
                execute_commands "${COMMANDS_SLEEP[@]}"
            ;;
            *)
                msg="acpi-eeepc-generic-handler: undefined 'button/sleep' event: $2 $3 $4"
                eeepc_notify "$msg" keyboard
            ;;
        esac
    ;;

    button/lid)
        # Detect correctly lid state
        lidstate=""
        # /proc/acpi is deprecated
        [ -e /proc/acpi/button/lid/LID/state ] && \
            lidstate=$(cat /proc/acpi/button/lid/LID/state | awk '{print $2}')
        [ "x$lidstate" == "x" ] && \
            [ "x$3" != "x" ] && lidstate=$3 # Use event given (2rd argument) to acpid
        # FIXME: It seems there is no /sys inteface to replace this
        # old /proc/acpi interface, so the latter is not deprecated...

        case "$lidstate" in
        open)
            xset dpms force on  # Screen on
            restore_brightness  # Restore brightness
        ;;
        closed)
            save_brightness     # Save brightness
            if [ "$COMMANDS_ON_LID_CLOSE" == "yes" ]; then
                state_file1="/proc/acpi/ac_adapter/AC0/state"
                state_file2="/sys/class/power_supply/AC0/online"
                # /proc/acpi/* is deprecated
                [ -e $state_file1 ] && ac_state=$(cat $state_file1 | awk '{print $2}' )
                # /sys is the future
                [ -e $state_file2 ] && ac_state=$(cat $state_file2)

                case $ac_state in
                1|on-line)
                    # AC adapter plugged in
                    execute_commands "${COMMANDS_LID_CLOSE_ON_AC[@]}"
                ;;
                0|off-line)
                    # Battery powered
                    execute_commands "${COMMANDS_LID_CLOSE_ON_BATTERY[@]}"
                ;;
                esac
            fi
        ;;
        *)
            msg="acpi-eeepc-generic-handler: undefined 'button/lid' event: $2 $3 $4"
            eeepc_notify "$msg" keyboard
        ;;
        esac
    ;;
    hotkey)
        case "$3" in
            $EEEPC_BLANK) # Silver function button 1 (Blank)
                logger "acpi-eeepc-generic-handler: (hotkey): Silver function button (Blank)"
                execute_commands "${COMMANDS_BUTTON_BLANK[@]}"
            ;;
            $EEEPC_RESOLUTION) # Silver function button 2 (Resolution)
                logger "acpi-eeepc-generic-handler: (hotkey): Silver function button (Resolution)"
                execute_commands "${COMMANDS_BUTTON_RESOLUTION[@]}"
            ;;
            $EEEPC_USER1) # Silver function button 3 (User1)
                logger "acpi-eeepc-generic-handler: (hotkey): Silver function button (User1)"
                execute_commands "${COMMANDS_BUTTON_USER1[@]}"
            ;;
            $EEEPC_USER2) # Silver function button 4 (User2)
                logger "acpi-eeepc-generic-handler: (hotkey): Silver function button (User2)"
                execute_commands "${COMMANDS_BUTTON_USER2[@]}"
            ;;
            $EEEPC_SHE_TOGGLE) # Super Hybrid Engine
                logger "acpi-eeepc-generic-handler: (hotkey): SHE"
                execute_commands "${COMMANDS_SHE_TOGGLE[@]}"
            ;;

            $EEEPC_SLEEP)
                suspend_check_blacklisted_processes "${SUSPEND_BLACKLISTED_PROCESSES[@]}"
                logger "acpi-eeepc-generic-handler: (hotkey): Sleep"
                eeepc_notify "Going to sleep..." gnome-session-suspend
                execute_commands "${COMMANDS_SLEEP[@]}"
            ;;
            $EEEPC_WIFI_TOGGLE) # WiFi Toggle
                logger "acpi-eeepc-generic-handler: (hotkey): WiFi toggle"
                execute_commands "${COMMANDS_WIFI_TOGGLE[@]}"
            ;;
            $EEEPC_WIFI_UP) # WiFi Up
                logger "acpi-eeepc-generic-handler: (hotkey): WiFi Up"
                execute_commands "${COMMANDS_WIFI_UP[@]}"
            ;;
            $EEEPC_WIFI_DOWN) # WiFi Down
                logger "acpi-eeepc-generic-handler: (hotkey): WiFi Down"
                execute_commands "${COMMANDS_WIFI_DOWN[@]}"
            ;;
            $EEEPC_TOUCHPAD_TOGGLE) # Toggle touchpad
                logger "acpi-eeepc-generic-handler: (hotkey): Toggling touchpad"
                execute_commands "${COMMANDS_TOUCHPAD_TOGGLE[@]}"
            ;;
            $EEEPC_RESOLUTION) # Change resolution
                logger "acpi-eeepc-generic-handler: (hotkey): Changing resolution"
                execute_commands "${COMMANDS_RESOLUTION[@]}"
            ;;
            $EEEPC_ROTATE) # Rotate screen.
                logger "acpi-eeepc-generic-handler: (hotkey): Rotate"
                execute_commands "${COMMANDS_ROTATE_TOGGLE[@]}"
            ;;
            $EEEPC_BRIGHTNESS_UP|$EEEPC_BRIGHTNESS_DOWN) # Brightness
                brightness_direction=`brightness_find_direction`
                if [ "$brightness_direction" == "up" ]; then
                    execute_commands "${COMMANDS_BRIGHTNESS_UP[@]}"
                    brightness_percentage=`brightness_get_percentage`
                    [ "$brightness_percentage" != "100" ] && logger "acpi-eeepc-generic-handler: (hotkey): Brightness Up ($brightness_percentage%)"
                    #[ "$brightness_percentage" != "100" ] && eeepc_notify "Brightness Up ($brightness_percentage%)" dialog-information
                elif [ "$brightness_direction" == "down" ]; then
                    execute_commands "${COMMANDS_BRIGHTNESS_DOWN[@]}"
                    brightness_percentage=`brightness_get_percentage`
                    [ "$brightness_percentage" != "0" ] && logger "acpi-eeepc-generic-handler: (hotkey): Brightness Down ($brightness_percentage%)"
                    #[ "$brightness_percentage" != "0" ] && eeepc_notify "Brightness Down ($brightness_percentage%)" dialog-information
                fi
            ;;
            $EEEPC_SCREEN_OFF) # Turn off screen
                execute_commands "${COMMANDS_SCREEN_OFF[@]}"
                eeepc_notify "Turning screen off..." dialog-information
            ;;
            $EEEPC_XRANDR_TOGGLE) # RandR
                execute_commands "${COMMANDS_XRANDR_TOGGLE[@]}"
                eeepc_notify "Toggling displays..." video-display
            ;;
            $EEEPC_XRANDR_TOGGLE_0) # RandR
                execute_commands "${COMMANDS_XRANDR_TOGGLE[@]}"
                eeepc_notify "Toggling displays..." video-display
            ;;
            $EEEPC_XRANDR_TOGGLE_1) # RandR
                execute_commands "${COMMANDS_XRANDR_TOGGLE[@]}"
                eeepc_notify "Toggling displays..." video-display
            ;;
            $EEEPC_XRANDR_TOGGLE_2) # RandR
                execute_commands "${COMMANDS_XRANDR_TOGGLE[@]}"
                eeepc_notify "Toggling displays..." video-display
            ;;
            $EEEPC_TASKMAN) # Task Manager
                logger "acpi-eeepc-generic-handler: (hotkey): Task Manager"
                execute_commands "${COMMANDS_TASKM[@]}"
            ;;
            $EEEPC_VOL_MUTE) # Mute
                logger "acpi-eeepc-generic-handler: (hotkey): Mute"
                execute_commands "${COMMANDS_MUTE[@]}"
                if [ "`volume_is_mute`" == "1" ]; then
                    volume_icon="audio-volume-muted"
                    mute_toggle=""
                elif [ "`volume_is_mute`" == "0" ]; then
                    volume_icon="audio-volume-medium"
                    mute_toggle="Un"
                fi
                eeepc_notify "${mute_toggle}Mute (`get_volume`%)" $volume_icon
            ;;
            $EEEPC_VOL_DOWN) # Volume Down
                if [ "`volume_is_mute`" == "1" ]; then
                    volume_icon="audio-volume-muted"
                elif [ "`volume_is_mute`" == "0" ]; then
                    volume_icon="audio-volume-low"
                fi
                if [ "`get_volume`" != "0" ]; then
                    execute_commands "${COMMANDS_VOLUME_DOWN[@]}"
                    eeepc_notify "Volume Down (`get_volume`%)" $volume_icon
                fi
            ;;
            $EEEPC_VOL_UP) # Volume Up
                if [ "`volume_is_mute`" == "1" ]; then
                    volume_icon="audio-volume-muted"
                elif [ "`volume_is_mute`" == "0" ]; then
                    volume_icon="audio-volume-high"
                fi
                if [ "`get_volume`" != "100" ]; then
                    execute_commands "${COMMANDS_VOLUME_UP[@]}"
                    eeepc_notify "Volume Up (`get_volume`%)" $volume_icon
                fi
            ;;
            00000050|00000051) # AC is plugged-in or unplugged
                # Don't do anything, should be handled in ac_adapter group
            ;;
#             00000052) # battery level critical
#             logger "Battery is critical, suspending"
#             $BATTERY_CRITICAL &
#             ;;
            *)
                msg="Hotkey (hotkey) undefined: $2 $3 $4"
                eeepc_notify "$msg" keyboard
            ;;
        esac
    ;;
    *)
        if [ "$NOTIFY_IGNORE_UNKNOWN" != "yes" ]; then
            msg="acpi-eeepc-generic-handler: undefined group/action ($1) event: $2 $3 $4"
            eeepc_notify "$msg" keyboard
            logger "$msg"
        fi
    ;;
esac

