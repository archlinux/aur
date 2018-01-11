#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de
# endregion
# region functions
alias bl.display.load_xinit_sources=bl_display_load_xinit_sources
bl_display_load_xinit_sources() {
    local __doc__='
    This functions loads all xinit source scripts.

    >>> bl.display.load_xinit_sources
    '
    local xinitRCPath='/etc/X11/xinit/xinitrc.d'
    if [ -d "$XINIT_RC_PATH" ]; then
        for filePath in "${XINIT_RC_PATH}/"*; do
            [ -x "$filePath" ] && source "$filePath"
        done
        unset filePath
    fi
}
alias bl.display.wacom_map=bl_display_wacom_map
bl_display_wacom_map() {
    local __doc__='
    This function maps wacom input device to given output display.

    >>> bl.display.wacom_map half
    '
    local rotation
    case $1 in none|half|cw|ccw)
        rotation="$1"
        ;;
    '');; *)
        echo -en\
            "Usage: bl.display.wacom_map [rotate]\nwhere [rotate] is one of\n"\
            "\thalf\tinvert mapping\n"\
            "\tccw\tturn mapping by 90° to the left\n"\
            "\tcw\tturn mapping by 90° to the right\n"\
            "\tnone\treset rotation\n"
        ;;
    esac
    display=''
    if [ "$display" = '' ]; then
        display='LVDS1'
    fi
    IFS=$'\n'
    for i in `xsetwacom --list devices | cut -f1 | sed 's/ *$//g'`; do
        xsetwacom set "$i" MapToOutput "$display"
        if [ $rotation ]; then
            xsetwacom set "$i" Rotate $rotation
        fi
    done
    unset IFS
}
alias bl.display.wacom_rotate=bl_display_wacom_rotate
bl_display_wacom_rotate() {
    local __doc__='
    Rotates a wacom display orientation 180°

    >>> bl.display.wacom_rotate
    '
    local _USE="Script to rotate mapping and view of an wacom-display (named output)."

    local _XRANDR_ARG=''
    local _WACOM_ARG=''
    local _OUTPUT='LVDS1'
    local _SELF='rotateWacomDisplay'

    while true; do
        case $1 in
            -h|--help)
            cat <<EOF
$_USE
Usage: $_SELF rotation [output]
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
            _XRANDR_ARG='inverted'
            _WACOM_ARG='half'
            shift;;
        -cw|--right)
            _XRANDR_ARG='right'
            _WACOM_ARG='cw'
            shift;;
        -ccw|--left)
            _XRANDR_ARG='left'
            _WACOM_ARG='ccw'
            shift;;
        -none|--normal)
            _XRANDR_ARG='normal'
            _WACOM_ARG='none'
            shift;;
        -n|--next)
            local _CURRENT_ROTATION=`xsetwacom --get "Wacom ISDv4 E6 Pen stylus" Rotate`
            case $_CURRENT_ROTATION in
                none)
                "$_SELF" -half;;
            half)
                "$_SELF" -cw;;
            cw)
                "$_SELF" -ccw;;
            ccw)
                "$_SELF" -none;;
            esac
            return $?
            ;;
        -*)
            echo "Error: Invalid argument: $1"
            sh  --help
            return 1
            ;;
        '')
            if [ $_WACOM_ARG ] && [ $_XRANDR_ARG ]; then
                break
            else
                "$_SELF" --next
                return 0
            fi
            ;;
        *)
            _OUTPUT=$1
        shift;;
        esac
    done
    xrandr --output $_OUTPUT --rotate $_XRANDR_ARG
    bl.display.wacom_map $_WACOM_ARG
    return $?
}
alias bl.display.wacom_toggle_finger_touch_state=bl_display_wacom_toggle_finger_touch_state
bl_display_wacom_toggle_finger_touch_state() {
    local __doc__='
    Toggles between enabled and disabled finger touch on wacom displays.

    >>> switchFingerTouchWacomEnabled
    >>> switchFingerTouchWacomEnabled enable
    >>> switchFingerTouchWacomEnabled disable
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
