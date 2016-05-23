#!/bin/sh

# user root login shell

command_askpass="/usr/bin/systemd-tty-ask-password-agent"

command_prompt() {
    
    local choice=""
    
    while [ "$choice" != "q" ] ; do
        echo
        echo "Select:"
        echo "c) crypt setup"
        echo "s) user shell"
        echo "r) restart"
        echo "q) quit"
        
        read -p ">" choice
        
        case $choice in
        1)
            echo "crypt setup"
            if [[ -f $command_askpass ]] ; then
                $command_askpass
            else
                echo "missing $command_askpass"
            fi
            ;;
        2) 
            echo "user shell"
            exec /bin/sh
            ;;
        3) 
            echo "restart"
            systemctl reboot
            ;;
        q) 
            echo "quit"
            exit 0
            ;;
        *)   
            echo "$choice ?"
        ;;
        esac
    done
            
}

command_cryptsetup() {
    
}

if [[ ps | grep -q "$command_askpass" ]] ; then
    $command_askpass
else 
    command_prompt
fi
