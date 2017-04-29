#!/usr/bin/bash

OLD_GATEWAY=`ip route show | grep '^default' | sed -e 's/default via \([^ ]*\).*/\1/'`

if [[ -n $OLD_GATEWAY ]]; then
  echo $OLD_GATEWAY > /run/vpn-old-gateway
  chmod 644 /run/vpn-old-gateway
fi
