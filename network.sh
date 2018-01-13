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
alias bl.network.restart_network='sudo ifdown -a &>/dev/null && sudo ifup -a &>/dev/null'
alias bl.network.wlan_start=bl.network_wlan_start
bl_network_wlan_start() {
    # shellcheck disable=SC2034
    local __doc__='
    Starts wlan functionality.

    `bl.network.wlan_start`
    '
    wpa_supplicant -c /etc/wpa_supplicant.conf -i wlan0 -D wext -B
    dhclient wlan0
    return $?
}
alias bl.network.wlan_stop=bl_network_wlan_stop
bl_network_wlan_stop() {
    # shellcheck disable=SC2034
    local __doc__='
    Stops wlan functionality.

    `bl.network.wlan_stop`
    '
    killall wpa_supplicant
    killall dhclient
    killall dhclient3
    return $?
}
alias bl.network.wlan_restart=bl_network_wlan_restart
bl_network_wlan_restart() {
    # shellcheck disable=SC2034
    local __doc__='
    Restart wlan functionality.

    `bl.network.wlan_restart`
    '
    bl.network.wlan_stop
    bl.network.wlan_start
    return $?
}
# endregion
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
