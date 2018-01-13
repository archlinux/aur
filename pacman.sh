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
alias bl.pacman.show_not_maintained_by_pacman_system_files=bl_tools_show_not_maintained_by_pacman_system_files
bl_pacman_show_not_maintained_by_pacman_system_files() {
    # shellcheck disable=SC2016,SC2034
    local __doc__='
    Shows all files which are not maintained by pacman on currently running
    system.

    `bl.pacman.show_not_maintained_by_pacman_system_file`
    '
    local allFiles=$(mktemp)
    local allMaintainedFiles=$(mktemp)

    sudo find / | sort | sed 's:/$::g' | sort | uniq 1>"$allFiles"
    pacman --query --list --quiet | sed 's:/$::g' | sort | \
        uniq 1>"$allMaintainedFiles"
    cat "$allFiles" "$allMaintainedFiles" | \
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
    local numberOfAllFiles=$(wc --lines $allFiles | cut --delimiter ' ' --field 1)
    local numberOfMaintainedFiles=$(wc --lines $allMaintainedFiles | cut --delimiter ' ' --field 1)
    let numberOfNotMaintainedFiles="${numberOfAllFiles} - ${numberOfMaintainedFiles}"
    cat << EOF

Number of files: $numberOfAllFiles 100%
Number of maintained files: $numberOfMaintainedFiles $(calculatePercent $numberOfAllFiles $numberOfMaintainedFiles)%
Number of not maintained files: $numberOfNotMaintainedFiles $(calculatePercent $numberOfAllFiles $numberOfNotMaintainedFiles)%
EOF
    return $?
}
alias bl.pacman.show_config_backups=bl_pacman_show_config_backups
bl_pacman_show_config_backups() {
    # shellcheck disable=SC2016,SC2034
    local __doc__='
    Shows all config backups created by pacman.

    `bl.pacman.show_config_backups`
    '
    cd / 1>/dev/null
    for pattern in '*.pacnew' '*.orig' '*_backup*' '*.pacorig'; do
        sudo find -name "$pattern" -and \( -type f -or -type l -or -type d \)
    done
    cd - 1>/dev/null
    return $?
}
# endregion
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
