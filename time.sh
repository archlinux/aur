#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de
# endregion
# region variables
bl_time_start_time=""
# endregion
# region functions
bl_time_start() {
    bl_time_start_time=$(date +%s%N)
}
alias bl.time.start='bl_time_start'
bl_time_get_elapsed() {
    local end_time="$(date +%s%N)"
    local elapsed_time_in_ns=$(( $end_time  - $time_timer_start_time ))
    local elapsed_time_in_ms=$(( $elapsed_time_in_ns / 1000000 ))
    echo "$elapsed_time_in_ms"
}
alias bl.time.get_elapsed='bl_time_get_elapsed'
# endregion
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
