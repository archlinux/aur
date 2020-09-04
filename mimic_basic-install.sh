source "/etc/pihole/setupVars.conf"
PI_HOLE_BIN_DIR="/usr/bin"

# from official basic-install.sh
valid_ip() {
    # Local, named variables
    local ip=${1}
    local stat=1

    # One IPv4 element is 8bit: 0 - 256
    local ipv4elem="(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]?|0)";
    # optional port number starting '#' with range of 1-65536
    local portelem="(#([1-9]|[1-8][0-9]|9[0-9]|[1-8][0-9]{2}|9[0-8][0-9]|99[0-9]|[1-8][0-9]{3}|9[0-8][0-9]{2}|99[0-8][0-9]|999[0-9]|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-6]))?"
    # build a full regex string from the above parts
    local regex="^${ipv4elem}\.${ipv4elem}\.${ipv4elem}\.${ipv4elem}${portelem}$"

    [[ $ip =~ ${regex} ]]

    stat=$?
    # Return the exit code
    return "${stat}"
}

valid_ip6() {
    local ip=${1}
    local stat=1

    # One IPv6 element is 16bit: 0000 - FFFF
    local ipv6elem="[0-9a-fA-F]{1,4}"
    # CIDR for IPv6 is 1- 128 bit
    local v6cidr="(\\/([1-9]|[1-9][0-9]|1[0-1][0-9]|12[0-8])){0,1}"
    # build a full regex string from the above parts
    local regex="^(((${ipv6elem}))((:${ipv6elem}))*::((${ipv6elem}))*((:${ipv6elem}))*|((${ipv6elem}))((:${ipv6elem})){7})${v6cidr}$"

    [[ ${ip} =~ ${regex} ]]

    stat=$?
    # Return the exit code
    return "${stat}"
}
