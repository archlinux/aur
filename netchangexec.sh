#!/bin/bash
declare -A device_status

if [ -z "$1" ] || [ "$1" = -h ]; then
    echo "$(basename "${BASH_SOURCE[0]}") \"[command when connect]\" \"[command when disconnect]\""
    echo "systemd usage:"
    echo \ \ \ \ systemctl status --user \$\(systemd-escape --template="$(basename "${BASH_SOURCE[0]}")"@.service \"\'command when connect\' \'command when disconnect\'\"\)
    exit 1
fi

upcommand="$1"
downcommand="$2"

eval_command() {
    if [ "$1" = 'up' ]; then
        eval "$upcommand"
    elif [ "$1" = 'down' ]; then
        eval "$downcommand"
    fi
}

while read -r line; do
    dev=$(awk '{for (i=1; i<=NF; i++) {if ($i == "dev") print $(i+1)}}' <<< "$line")
    ip=$(awk '{for (i=1; i<=NF; i++) {if ($i == "dev") print $(i-1)}}' <<< "$line")

    if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        iptype=4
    elif [[ $ip =~ ^[0-9a-fA-F:]+(/[0-9]+)?$ ]]; then
        iptype=6
    else
        echo "Invalid IP address $ip"
        exit 1
    fi

    if [[ $line =~ ^Deleted.* ]]; then
        for the_iptype in 6 4; do
            if [ "$iptype" = "$the_iptype" ]; then
                if [ "${device_status["$dev:v$iptype"]}" = 'down' ]; then
                    break
                fi

                device_status["$dev:v$iptype"]='down'
                echo "$dev disconnect $ip"
                eval_command down
            fi
        done
    else
        for the_iptype in 6 4; do
            if [ "$iptype" = "$the_iptype" ]; then
                if [ "${device_status["$dev:v$iptype"]}" = 'up' ]; then
                    break
                fi

                device_status["$dev:v$iptype"]='up'
                echo "$dev connect $ip"
                eval_command up
            fi
        done
    fi
done < <(ip mon | grep --line-buffered REACHABLE)
