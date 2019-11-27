#!/usr/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "Program must be run as root."
  exit 1
fi

if [ ! -d "/etc/webthings-gateway" ]; then
  mkdir "/etc/webthings-gateway"
  chown -R webthings:webthings "/etc/webthings-gateway"
fi

cd /opt/webthings-gateway
su -c "node build/gateway.js" webthings

# vim:set ts=2 sw=2 et ft=sh:
