#!/bin/bash

setupVars=/etc/pihole/setupVars.conf

# official pihole basic-install.sh code here
getIPv4stuff()
{
	IPv4dev=$(ip route get 8.8.8.8 | awk '{for(i=1;i<=NF;i++)if($i~/dev/)print $(i+1)}')
	IPv4_address=$(ip -o -f inet addr show dev "$IPv4dev" | awk '{print $4}' | awk 'END {print}')
}

# official pihole basic-install.sh code here
getIPv6stuff()
{
	if [ -e /proc/net/if_inet6 ]; then
		IPv6_address=$(ip -6 route get 2001:4860:4860::8888 | awk -F " " '{ for(i=1;i<=NF;i++) if ($i == "src") print $(i+1) }')
	fi
}

# from official pihole basic-install.sh, almost
finalExports() {
    #If it already exists, lets overwrite it with the new values.
    if [[ -f ${setupVars} ]];then
        rm ${setupVars}
    fi
    {
    echo "PIHOLE_INTERFACE=${IPv4dev}"
    echo "IPV4_ADDRESS=${IPv4_address}"
    echo "IPV6_ADDRESS=${IPv6_address}"
    }>> "${setupVars}"
}

getIPv4stuff
getIPv6stuff
finalExports
