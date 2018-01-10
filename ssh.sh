#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de
# endregion
alias bl.ssh.screen=bl_ssh_screen
bl_ssh_screen() {
    local __doc__='
    Wraps the ssh client for automatically starting a screen session on
    server.

    >>> bl.ssh.screen user@host [SSH_OPTIONS]
    '
    ssh "$1" -t 'screen -r || screen -S main' "${@:2}"
    return $?
}
alias bl.ssh.make_key=bl_ssh_make_key
bl_ssh_make_key() {
    local __doc__='
    Generates a new ssh key.

    >>> bl.ssh.make_key
    ...
    >>> bl.ssh.make_key hans
    ...
    '
    local user="$ILU_USER_EMAIL_ADDRESS"
    if [ "$1" ]; then
        user="$1"
    fi
    ssh-keygen -t rsa -C "$user"
    return $?
}
alias bl.ssh.print=bl_ssh_print
bl_ssh_print() {
    local __doc__='
    Prints a file via ssh. A given printable file will be sent to a given
    location via scp. The file be stored in remotes home directory with given
    name. After this procedure a remote print order will be sent.

    >>> bl.ssh.print /home/hans/document.txt
    ...
    >>> bl.ssh.print /home/hans/document.txt hans
    ...
    >>> bl.ssh.print /home/hans/document.txt hans hp15
    ...
    '
    local user='sickertt'
    local host='login.informatik.uni-freiburg.de'
    local defaultPrinter='hp15'
    local usageMessage="Usage: "$0" <file> [login] [printer] [withFileContentPipe]"

    if (( $# = 0 )); then
        echo "$usageMessage"
    # 1. argument: File, which we want to print.
    elif [ -f "$1" ]; then
        # 2. argument: Check for given user name.
        if [ "$2" ]; then
            local login="$2"@"$host"
        elif [ "$user" ]; then
            local login="$user"@"$host"
        else
            # Grab user from "~/.ssh/config".
            local userRow=$(cat ~/.ssh/config | grep "$host" -A1 | \
                grep -i user)
            if [ "$userRow" ]; then
                local user=$(echo ${userRow} | sed s/user\\s//ig)
                local login="$user"@"$host"
            else
                echo 'No login given.'
                echo "$usageMessage"
            fi
        fi
        # 3. argument: Select printer.
        local printer=defaultPrinter
        if [ "$3" ]; then
            local printer="$3"
        fi
        # 4. argument: Determines which way to use for transport file content.
        if [ "$4" ]; then
            echo 'Pipe file content through ssh.'
            cat "$1" | ssh "$login" lpr -P"$printer"
            return $?
        else
            echo "Copy file to server via scp ($login)."
            scp "$1" "${login}:/tmp/.sshPrint"
            ssh "$login" lpr -P"$printer" ~/.sshPrint
            return $?
        fi
    else
        echo "Given file doesn't exist."
        return $?
    fi
}
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
