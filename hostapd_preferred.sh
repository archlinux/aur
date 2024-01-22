#! /usr/bin/sh
set -e
iw=/usr/bin/iw
ip=/usr/bin/ip
systemctl=/usr/bin/systemctl

get_wireless_interface() {
  desc='Wireless interface'

  lshw -C network -json 2>/dev/null | jq -r '.[] |
    select(.description == "'"$desc"'") |
    .logicalname |
    if type == "array" then
      .[]
    else
      .
    end' |\
  while read -r item; do
    if ip link show "$item" 2> /dev/null > /dev/null; then
      echo "$item"
      break
    fi
  done
}

br='br-wl'
phys_wl0=$(get_wireless_interface)
#virt_wl1=$(echo "$wl0" | grep -o -E '^[^0-9]+')$(( ${wl0//[^0-9]/} + 1 ))
wl0='wlan0'
wl1='wlan1'
wl0_conf='2.4Ghz'
wl1_conf='5Ghz'
addr='192.168.1.1/24'

. /etc/hostapd/preferred_config

[ "$phys_wl0" == "$wl0" ] || $ip link set dev "$phys_wl0" name "$wl0"
$iw dev $wl0 interface add $wl1 type __ap
$ip link add name $br type bridge
$ip link set $br up
$ip address add $addr dev $br

# waiting hostapd-ACS@.service active or inactive. start hostapd@.service if inactive, ignore otherwise
while [ $(systemctl is-active hostapd-ACS@"$wl0_conf".service) == 'activating' ]; do sleep 1; done
$systemctl is-active hostapd-ACS@"$wl0_conf".service --quiet || $systemctl start hostapd@"$wl0_conf".service

while [ $(systemctl is-active hostapd-ACS@"$wl1_conf".service) == 'activating' ]; do sleep 1; done
$systemctl is-active hostapd-ACS@"$wl1_conf".service --quiet || $systemctl start hostapd@"$wl1_conf".service

