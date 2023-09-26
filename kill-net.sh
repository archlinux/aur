#!/bin/bash
start() {
echo "                  .++++++++++                  "
echo "             ++++++++    .++++++++             "
echo "           ++++                 .+++           "
echo "         +++                       +++.        "
echo "       +++                         +++++       "
echo "      ++                         +++   +++     "
echo "    +++        ################++++     +++    "
echo "   +++     -#################++++###     +++   "
echo "   ++    #######+           +++-######-   ++   "
echo "  +++  #####.     ########+++     -###### +++  "
echo "  +++  ###    ##########+++######    ###+  ++  "
echo "  ++       -#######+  +++  .#######+       ++  "
echo "  ++      #####     +++         #####      ++  "
echo "  +++      ##    -++++#######+    ##      +++  "
echo "   ++          #++++############          ++   "
echo "   +++         +++#         +###         +++   "
echo "    +++      +++      ###               +++    "
echo "     +++   +++       #####             +++     "
echo "       +++++          ####            +++      "
echo "        ++++                        +++        "
echo "          ++++                   ++++          "
echo "             +++++++       -++++++             "
echo "                 .+++++++++++-                 "
echo "                                               "
}
cleanup() {
    echo ""
    echo "Caught Ctrl+C, terminating zmap..."
    for pid in "${pids[@]}"; do
        sudo kill "$pid"
    done
    exit 1
}
int() {
    ip_address=$(ip route get 1 | awk '{print $7}')
    if [ -z "$ip_address" ]; then
        echo "Unable to determine the IP address."
        exit 1
    fi
    subnet=$(get_subnet "$ip_address")
    echo "The network subnet is: $subnet"
    wireless_interface=$(iwconfig 2>/dev/null | grep -o '^[[:alnum:]]\+' | head -n 1)
    echo "Your wifi card is: $wireless_interface"
    instances=5
    read -p "How many instances? (Default 5): " user_instances
    if [ -n "$user_instances" ]; then
        instances="$user_instances"
    fi
    echo "You've selected $instances instances."
    read -p "Ready to proceed? Press Enter to continue..."
    trap cleanup SIGINT
}
get_subnet() {
    local ip_address="$1"
    IFS='.' read -r -a octets <<< "$ip_address"
    echo "${octets[0]}"
}
run() {
    sudo echo "Stop with Crl + C"
    blacklist_file="/tmp/kill-net_blacklist.conf"
    echo " " >> $blacklist_file
    for ((i = 1; i <= instances; i++)); do
        sudo zmap $subnet.0.0.0/8 -i $wireless_interface -b $blacklist_file -p 22 >/dev/null 2>&1 &
        pids+=("$!")
        sudo zmap $subnet.0.0.0/8 -i $wireless_interface -b $blacklist_file -p 80 >/dev/null 2>&1 &
        pids+=("$!")
        sudo zmap $subnet.0.0.0/8 -i $wireless_interface -b $blacklist_file -p 443 >/dev/null 2>&1 &
        pids+=("$!")
        sudo zmap $subnet.0.0.0/8 -i $wireless_interface -b $blacklist_file -p 8080 >/dev/null 2>&1 &
        pids+=("$!")
    done
    echo "Killing Network!!!!!!!"
    wait
    echo "All zmap instances have completed."
}
run_with_sudo() {
    if [ "$(whoami)" != "root" ]; then
        sudo "$0" "$@"
        exit $?
    fi
    start
    int
    #run
    sudo echo "ran with sudo"
}
run_with_sudo "$@"
