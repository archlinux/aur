#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de
# endregion
# region import
# shellcheck source=./module.sh
source "$(dirname "${BASH_SOURCE[0]}")/module.sh"
bl.module.import bashlink.number
# endregion
# region functions
alias bl.pacman.show_config_backups=bl_pacman_show_config_backups
bl_pacman_show_config_backups() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Shows all config backups created by pacman.

        ```bash
            bl.pacman.show_config_backups
        ```
    '
    cd / 1>/dev/null
    for pattern in '*.pacnew' '*.orig' '*_backup*' '*.pacorig'; do
        sudo find -name "$pattern" -and \( -type f -or -type l -or -type d \)
    done
    cd - 1>/dev/null
    return $?
}
alias bl.pacman.show_not_maintained_by_pacman_system_files=bl_tools_show_not_maintained_by_pacman_system_files
bl_pacman_show_not_maintained_by_pacman_system_files() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Shows all files which are not maintained by pacman on currently running
        system.

        ```bash
            bl.pacman.show_not_maintained_by_pacman_system_file
        ```
    '
    local paths_file_path="$(mktemp)"
    local maintained_paths_file_path="$(mktemp)"
    sudo find / | sort | sed 's:/$::g' | sort | uniq 1>"$paths_file_path"
    pacman --query --list --quiet | sed 's:/$::g' | sort | \
        uniq 1>"$maintained_paths_file_path"
    cat "$paths_file_path" "$maintained_paths_file_path" | \
        sed 's:^/home/.*$::g' | \
        sed 's:^/root/.*$::g' | \
        sed 's:^/dev/.*$::g' | \
        sed 's:^/sys/.*$::g' | \
        sed 's:^/tmp/.*$::g' | \
        sed 's:^/run/.*$::g' | \
        sed 's:^/var/tmp/.*$::g' | \
        sed 's:^/var/cache/.*$::g' | \
        sed 's:^/var/log/.*$::g' | \
        sed 's:^/proc/.*$::g' | \
        sort | uniq --unique
    local number_of_files=$(wc --lines "$paths_file_path" | cut --delimiter ' ' --field 1)
    local number_of_maintained_files=$(wc --lines "$maintained_paths_file_path" | cut --delimiter ' ' --field 1)
    local number_if_not_maintained_files
    (( number_of_not_maintained_files=number_of_all_files - number_of_maintained_files ))
    cat << EOF

Number of files: $number_of_files 100%
Number of maintained files: $number_of_maintained_files $(bl.number.calculate_percent $number_of_files $number_of_maintained_files)%
Number of not maintained files: $number_of_not_maintained_files $(bl.number.calculate_percent $number_of_files $number_of_not_maintained_files)%
EOF
    return $?
}
# endregion
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
