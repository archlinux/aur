#!/bin/bash
# use: sudo lte up

if [[ "$1" = "" ]]; then
  echo "nothing to do, try with up or down"
  exit 1
fi

CONF_FILE=/etc/xmm7360

# check if xmm7360.ini is available or exit
if [ -f "$CONF_FILE" ]; then
  source $CONF_FILE
else
  echo "no configuration file found"
  exit 1
fi

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root!"
  exit 1
fi

echo "lte.sh: manage xmm7360-pci"
echo "APN: $apn"
echo ""

# down param
if [[ "$1" = "down" ]]; then
  echo "taking wwan0 down!" 
  ip link set wwan0 down
  exit
fi

if [[ "$1" = "up" ]]; then
  echo "bringing wwan0 up!" 

  python3 /usr/lib/xmm7360-pci-spat/rpc/open_xdatachannel.py -c $CONF_FILE
  ip link set wwan0 up
fi
