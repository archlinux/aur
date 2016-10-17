#!/bin/bash

setupVars=/etc/pihole/setupVars.conf

getDNSs()
{
	dnsmasqdns=(`grep server= /etc/pihole/configs/dnsmasq.complete | awk -F "=" '{print $2}'`)
	piholeDNS1=${dnsmasqdns[0]}
	piholeDNS2=${dnsmasqdns[1]}
}

# official pihole basic-install.sh code here
getIPv4stuff()
{
	IPv4dev=$(ip route get 8.8.8.8 | awk '{for(i=1;i<=NF;i++)if($i~/dev/)print $(i+1)}')
	# change local ip to unusable 0.0.0.0 (ref. http://dlaa.me/blog/post/skyhole), and :: for ipv6
	IPv4_address="0.0.0.0"
}

# official pihole basic-install.sh code here
getIPv6stuff()
{
	if [ -e /proc/net/if_inet6 ]; then
		# change local ip to unusable 0.0.0.0 (ref. http://dlaa.me/blog/post/skyhole), and :: for ipv6
		IPv6_address="::"
	fi
}

# from official pihole basic-install.sh, almost
finalExports() {
    #If it already exists, lets overwrite it with the new values.
    if [[ -f ${setupVars} ]];then
        rm ${setupVars}
    fi
    {
    echo "piholeInterface=${IPv4dev}"
    echo "IPv4_address=${IPv4_address}"
    echo "IPv6_address=${IPv6_address}"
    echo "piholeDNS1=${piholeDNS1}"
    echo "piholeDNS2=${piholeDNS2}"
    }>> "${setupVars}"
}

getDNSs
getIPv4stuff
getIPv6stuff
finalExports
