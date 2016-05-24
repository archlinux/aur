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
    local command="/bin/$agent"
    if [ ! -f "$command" ] ; then
        echo "missing $command"
        return 1
    fi
    local pid=$($command --list | head -n 1 | parse_crypt_pid)
    echo "pid $pid"
    local ask=$($command --query)
    local count=1
    while is_pid_present "$pid" ; do
        sleep 0.5
        let count+=1
        if [ "$count" -gt "10" ] ; then
            echo "failure"
            return 1
        fi
    done
    echo "success"
    do_close
}

do_shell() {
    exec /bin/sh
}

do_reboot() {
    /bin/systemctl reboot
}

do_quit() {
    exit 0
}

do_close() {
    exec /bin/sh -c exit
}

is_ask_pending() {
    ps | grep -q -e "$agent"
}

is_ssh_connect() {
    [ -n "$SSH_CONNECTION" ]
}

is_pid_present() {
    ps | grep -E -e "[ ]+${1}[ ]+.*"
}

do_default() {
    is_ssh_connect || exit 0
    if is_ask_pending ; then
        do_crypt
    else 
        do_prompt
    fi
}

# pattern: "'Please enter passphrase for disk VBOX_HARDDISK (root)!' (PID 167)" 
parse_crypt_pid () {
    echo "$1" | sed -r "s%.*PID[ ]+([0-9]+).*%\1%"
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
