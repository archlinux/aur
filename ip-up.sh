#!/usr/bin/bash

OLD_GATEGAY=$(cat /run/vpn-old-gateway)

[[ -n "$OLD_GATEGAY" ]] || exit

for ip_range in $(cat /etc/china-ip-skip-vpn/china-ip-list.txt); do
  ip route add $ip_range via $OLD_GATEGAY
done
