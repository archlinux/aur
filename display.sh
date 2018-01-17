#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de
# endregion
# shellcheck disable=SC2016,SC2155
# region functions
alias bl.display.load_xinit_sources=bl_display_load_xinit_sources
bl_display_load_xinit_sources() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        This functions loads all xinit source scripts.

        ``bash
            bl.display.load_xinit_sources
        ```
    '
    local xinit_rc_path='/etc/X11/xinit/xinitrc.d'
    if [ -d "$xinit_rc_path" ]; then
        local file_path
        for file_path in "${xinit_rc_path}/"*; do
            # shellcheck disable=SC1090
            [ -x "$file_path" ] && source "$file_path"
        done
    fi
}
alias bl.display.wacom_map=bl_display_wacom_map
bl_display_wacom_map() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        This function maps wacom input device to given output display.

        ```bash
            bl.display.wacom_map half
        ```
    '
    local rotation
    case $1 in none|half|cw|ccw)
        rotation="$1"
        ;;
    '');; *)
        echo -en \
            'Usage: bl.display.wacom_map [rotate]\n' \
            'where [rotate] is one of\n' \
            '\thalf\tinvert mapping\n' \
            '\tccw\tturn mapping by 90° to the left\n' \
            '\tcw\tturn mapping by 90° to the right\n' \
            '\tnone\treset rotation\n'
        ;;
    esac
    display=''
    if [ "$display" = '' ]; then
        display=LVDS1
    fi
    IFS=$'\n'
    local device
    for device in $(xsetwacom --list devices | cut -f1 | sed 's/ *$//g'); do
        xsetwacom set "$device" MapToOutput "$display"
        xsetwacom set "$device" Rotate "$rotation"
    done
    unset IFS
}
alias bl.display.wacom_rotate=bl_display_wacom_rotate
bl_display_wacom_rotate() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Rotates a wacom display orientation by 180 degree.

        ```bash
            bl.display.wacom_rotate
        ```
    '
    local xrandr_argument=''
    local wacom_argument=''
    local output=LVDS1
    local self=bl.display.wacom_rotate

    while true; do
        case $1 in
            -h|--help)
            cat <<EOF
Script to rotate mapping and view of an wacom-display (named output).

Usage: $self rotation [output]
Possible rotations are:
-half, --inverted: turn display 180°.
-cw, --right: turn display 90° clockwise.
-ccw, --left: turn display 90° counter-clockwise.
-none, --normal: no rotation.
-n, --next: enable the next rotation as sorted in the list above.
Optionally a valid name for an output listet by xrandr can be given.
EOF
            return 0
        ;;
        -half|--inverted)
            xrandr_argument=inverted
            wacom_argument=half
            shift;;
        -cw|--right)
            xrandr_argument=right
            wacom_argument=cw
            shift;;
        -ccw|--left)
            xrandr_argument=left
            wacom_argument=ccw
            shift;;
        -none|--normal)
            xrandr_argument=normal
            wacom_argument=none
            shift;;
        -n|--next)
            local _CURRENT_ROTATION=$(xsetwacom --get 'Wacom ISDv4 E6 Pen stylus' Rotate)
            case $_CURRENT_ROTATION in
                none)
                $self -half;;
            half)
                $self -cw;;
            cw)
                $self -ccw;;
            ccw)
                $self -none;;
            esac
            return $?
            ;;
        -*)
            echo "Error: Invalid argument: $1"
            sh  --help
            return 1
            ;;
        '')
            if [ $wacom_argument ] && [ $xrandr_argument ]; then
                break
            else
                $self --next
                return 0
            fi
            ;;
        *)
            output="$1"
        shift;;
        esac
    done
    xrandr --output "$output" --rotate "$xrandr_argument"
    bl.display.wacom_map "$wacom_argument"
    return $?
}
alias bl.display.wacom_toggle_finger_touch_state=bl_display_wacom_toggle_finger_touch_state
bl_display_wacom_toggle_finger_touch_state() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Toggles between enabled and disabled finger touch on wacom displays.

        ```bash
            bl.display.wacom_toggle_finger_touch_state
        ```

        ```bash
            bl.display.wacom_toggle_finger_touch_state enable
        ```

        ```bash
            bl.display.wacom_toggle_finger_touch_state disable
        ```
    '
    if (xinput --list-props 'Wacom ISDv4 E6 Finger touch' | grep \
        'Device Enabled' | cut --fields 3 | grep 1 --quiet
        [[ "$1" != enable ]]) || [[ "$1" == disable ]]
    then
        xinput set-prop 'Wacom ISDv4 E6 Finger touch' 'Device Enabled' 0
        return $?
    else
        xinput set-prop 'Wacom ISDv4 E6 Finger touch' 'Device Enabled' 1
        return $?
    fi
}
# endregion
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
