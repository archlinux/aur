#!/usr/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "Program must be run as root."
  exit 1
fi

if [ ! -d "/etc/webthings-gateway" ]; then
  mkdir "/etc/webthings-gateway"
  chown -R webthings:webthings "/etc/webthings-gateway"
fi

# WORKAROUND for `setpriv: libcap-ng is too old for "all" caps`, previously "-all" was used here
# create a list to drop all capabilities supported by current kernel
cap_prefix="-cap_"
caps="$cap_prefix$(seq -s ",$cap_prefix" 0 $(cat /proc/sys/kernel/cap_last_cap))"

cd /opt/webthings-gateway
setpriv \
  --reuid=webthings \
  --regid=webthings \
  --init-groups \
  --inh-caps=$caps \
  node build/gateway.js

# vim:set ts=2 sw=2 et ft=sh:
