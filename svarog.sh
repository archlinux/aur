#!/bin/bash

clear

refresh_interval=1
tput civis
trap "tput cnorm; clear; exit" SIGINT SIGTERM

bar_char="█"
bar_len=20

while true; do
    tput cup 0 0

    c_host="\033[34m"
    c_user="\033[32m"
    c_date="\033[33m"
    c_kernel="\033[31m"
    c_distro="\033[33m"
    c_uptime="\033[35m"
    c_ram="\033[36m"
    c_disk="\033[33m"
    c_ip="\033[36m"
    c_wifi="\033[35m"
    c_reset="\033[0m"

    echo "Svarog 1.0 - By: SrWyatt"
    echo

    hostname_=$(hostname)
    user_=$USER
    date_=$(date '+%Y-%m-%d %H:%M:%S')
    kernel_=$(uname -r)

    if [ -f /etc/os-release ]; then
        distro=$(grep -Po '(?<=^PRETTY_NAME=).+' /etc/os-release | tr -d '"')
    elif [ -f /etc/debian_version ]; then
        distro="Debian $(cat /etc/debian_version)"
    elif [ -f /etc/redhat-release ]; then
        distro=$(cat /etc/redhat-release)
    else
        distro="Linux (Unknown)"
    fi

    uptime_=$(uptime -p)
    ram_total=$(free -m | awk '/Mem:/ {print $2}')
    ram_used=$(free -m | awk '/Mem:/ {print $3}')
    disk_usage=$(df -h / | awk 'NR==2 {print $3 "/" $2 " (" $5 ")"}')

    if command -v curl &>/dev/null; then
        ip_public=$(curl -s ifconfig.me)
    else
        ip_public="curl not installed"
    fi

    ram_ratio=$((ram_used*bar_len/ram_total))
    ram_bar=$(printf "%0.s$bar_char" $(seq 1 $ram_ratio))
    ram_bar+=$(printf "%0.s " $(seq $ram_ratio $bar_len))
    ram_pct=$((ram_used*100/ram_total))

    iface_default=$(ip route 2>/dev/null | grep '^default' | awk '{print $5}')
    [ -z "$iface_default" ] && iface_default="(none)"
    interfaces=()
    max_iface_len=5; max_ip4_len=4; max_ip6_len=4; max_mac_len=3; max_tx_len=2; max_rx_len=2

    while IFS= read -r line; do
        iface=$(echo "$line" | awk '{print $1}')
        ip4=$(echo "$line" | awk '{print $2}')
        ip6=$(ip -6 addr show dev "$iface" 2>/dev/null | grep 'scope global' | awk '{print $2}' | head -n1)
        ip6=${ip6:-"(no IPv6)"}
        mac=$(ip link show "$iface" | awk '/ether/ {print $2}')
        tx=$(cat /sys/class/net/$iface/statistics/tx_bytes 2>/dev/null || echo 0)
        rx=$(cat /sys/class/net/$iface/statistics/rx_bytes 2>/dev/null || echo 0)
        status=$(cat /sys/class/net/$iface/operstate 2>/dev/null)
        [[ "$status" != "up" ]] && status="down"
        marker=" "; [[ "$iface" == "$iface_default" ]] && marker=">"

        (( ${#iface} > max_iface_len )) && max_iface_len=${#iface}
        (( ${#ip4} > max_ip4_len )) && max_ip4_len=${#ip4}
        (( ${#ip6} > max_ip6_len )) && max_ip6_len=${#ip6}
        (( ${#mac} > max_mac_len )) && max_mac_len=${#mac}
        (( ${#tx} > max_tx_len )) && max_tx_len=${#tx}
        (( ${#rx} > max_rx_len )) && max_rx_len=${#rx}

        interfaces+=("$marker|$iface|$ip4|$ip6|$mac|$tx|$rx|$status")
    done < <(ip -o -4 addr show 2>/dev/null | awk '{print $2, $4}')

    if command -v iwgetid &>/dev/null; then
        ssid=$(iwgetid -r)
        [ -z "$ssid" ] && ssid="(N/A)"
    else
        ssid="(iwgetid not installed)"
    fi

    printf "${c_host}%-10s${c_reset} %s\n" "Host:" "$hostname_"
    printf "${c_user}%-10s${c_reset} %s\n" "User:" "$user_"
    printf "${c_date}%-10s${c_reset} %s\n" "Date:" "$date_"
    printf "${c_kernel}%-10s${c_reset} %s\n" "Kernel:" "$kernel_"
    printf "${c_distro}%-10s${c_reset} %s\n" "Distro:" "$distro"
    printf "${c_uptime}%-10s${c_reset} %s\n" "Uptime:" "$uptime_"
    printf "${c_ram}%-10s${c_reset} [%s] %s/%s MB (%d%%)\n" "RAM:" "$ram_bar" "$ram_used" "$ram_total" "$ram_pct"
    printf "${c_disk}%-10s${c_reset} %s\n" "Disk:" "$disk_usage"
    printf "${c_ip}%-10s${c_reset} %s\n" "Public IP:" "$ip_public"
    printf "${c_wifi}%-10s${c_reset} %s\n\n" "WiFi SSID:" "$ssid"

    echo "Interfaces:"
    printf "%-2s %-*s %-*s %-*s %-*s %-10s %-10s %-8s\n" "" $max_iface_len "IFACE" $max_ip4_len "IPv4" $max_ip6_len "IPv6" $max_mac_len "MAC" "TX (B)" "RX (B)" "STATUS"
    echo "-------------------------------------------------------------------------------------------------"

    for iface in "${interfaces[@]}"; do
        IFS='|' read -r marker name ip4 ip6 mac tx rx status <<< "$iface"
        if [ "$tx" -ge 1048576 ]; then tx_val="$(awk "BEGIN{printf \"%.1f MB\",$tx/1048576}")"; else tx_val="$((tx/1024)) KB"; fi
        if [ "$rx" -ge 1048576 ]; then rx_val="$(awk "BEGIN{printf \"%.1f MB\",$rx/1048576}")"; else rx_val="$((rx/1024)) KB"; fi

        printf "%-2s %-*s %-*s %-*s %-*s %-10s %-10s %-8s\n" \
            "$marker" $max_iface_len "$name" $max_ip4_len "$ip4" $max_ip6_len "$ip6" $max_mac_len "$mac" \
            "$tx_val" "$rx_val" "$status"
    done

    sleep $refresh_interval
done
