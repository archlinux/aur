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
	piholeInterface=$(ip route get 8.8.8.8 | awk '{for(i=1;i<=NF;i++)if($i~/dev/)print $(i+1)}')
	piholeIPv4=$(ip -o -f inet addr show dev "$piholeInterface" | awk '{print $4}' | awk 'END {print}')
}

# official pihole basic-install.sh code here
getIPv6stuff()
{
	if [ -e /proc/net/if_inet6 ]; then
		piholeIPv6=$(ip -6 route get 2001:4860:4860::8888 | awk -F " " '{ for(i=1;i<=NF;i++) if ($i == "src") print $(i+1) }')
	fi
}

#from official pihole basic-install.sh, almost
finalExports() {
    #If it already exists, lets overwrite it with the new values.
    if [[ -f ${setupVars} ]];then
        ${SUDO} rm ${setupVars}
    fi
    ${SUDO} echo "piholeInterface=${piholeInterface}" >> ${setupVars}
    ${SUDO} echo "IPv4addr=${piholeIPv4}" >> ${setupVars}
    ${SUDO} echo "piholeIPv4=${piholeIPv4}" >> ${setupVars}
    ${SUDO} echo "piholeIPv6=${piholeIPv6}" >> ${setupVars}
    ${SUDO} echo "piholeDNS1=${piholeDNS1}" >> ${setupVars}
    ${SUDO} echo "piholeDNS2=${piholeDNS2}" >> ${setupVars}
}

getDNSs
getIPv4stuff
getIPv6stuff
finalExports
