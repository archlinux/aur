#!/bin/sh

# This file is part of https://aur.archlinux.org/packages/initrd-dropbear/

# location: /etc/dropbear/shell.sh

# user root login shell program

do_prompt() {
    local choice=""
    while [ "$choice" != "q" ] ; do
        echo
        echo "Select:"
        echo "c) crypt setup"
        echo "s) user shell"
        echo "r) reboot"
        echo "q) quit"
        read -p ">" choice
        case $choice in
        c) do_crypt ;;
        s) do_shell ;;
        r) do_reboot ;;
        q) do_quit ;;
        *) echo "$choice ?" ;;
        esac
    done
}

do_quit() {
    echo "do_quit"
    exit 0
}

do_reboot() {
    echo "do_reboot"
    /bin/systemctl reboot
}

do_crypt() {
    echo "do_crypt"
    if [[ -f /bin/$agent ]] ; then
        $agent
    else
        echo "missing $agent"
    fi
}

do_shell() {
    echo "do_shell"
    exec /bin/sh
}

do_setup() {
    echo "do_setup"
    local shell="/etc/dropbear/shell.sh"
    local target="/etc/passwd"
    sed -i -r -e "s|root.*|root:x:0:0:root:/root:$shell|" $target    
}

do_default() {
    echo "do_default"
    if ps | grep -q "$agent" ; then
        $agent
    else 
        do_prompt
    fi
}

program() {
    local "$@"
    [[ $agent ]] || agent="systemd-tty-ask-password-agent"
    case $entry in
        crypt)  do_crypt ;;
        setup)  do_setup ;;
        prompt) do_prompt ;;
            *)  do_default ;;
    esac    
}

program
