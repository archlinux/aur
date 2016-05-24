#!/bin/sh

# This file is part of https://aur.archlinux.org/packages/initrd-dropbear/

# NOTE: initramfs inclusion marker
# /etc/initrd-release

# user root login shell program for dropbear

do_prompt() {
    local choice
    while [ "$choice" != "q" ] ; do
        echo
        echo "select:"
        echo "c) crypt agent"
        echo "s) user shell"
        echo "r) reboot"
        echo "q) quit"
        read -p ">" choice
        case "$choice" in
        c) do_crypt ;;
        s) do_shell ;;
        r) do_reboot ;;
        q) do_quit ;;
        *) echo "$choice ?" ;;
        esac
    done
}

do_crypt() {
    # provide password answer
    local command result status
    command="/bin/$agent"
    if [[ -f $command ]] ; then
        result=$($command 2>&1); status=$?
        case $status in
            0) echo "success" ; return 0 ;;
            *) echo "failure:\n$result\n"; return 1 ;;
        esac       
    else
        echo "missing $command"
    fi
}

do_shell() {
    # replace process
    exec /bin/sh
}

do_reboot() {
    /bin/systemctl reboot
}

do_quit() {
    exit 0
}

is_ask_pending() {
    ps | grep -q "$agent"
}

is_ssh_connect() {
    [ -n "$SSH_CONNECTION" ]
}

do_default() {
    is_ssh_connect || exit 0
    if is_ask_pending ; then
        do_crypt
    else 
        do_prompt
    fi
}

program() {
    local "$@"
    [ -n "$agent" ] || local agent="systemd-tty-ask-password-agent"
    case "$entry" in
        crypt)  do_crypt ;;
        shell)  do_shell ;;
        reboot) do_reboot ;;
        prompt) do_prompt ;;
            *)  do_default ;;
    esac       
}

program "$@"
