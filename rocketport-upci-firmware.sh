#!/usr/bin/bash

# 2017-07-17 -CJS (GPL)

# switches:
#   --systemd - run notify at end. This MUST be the first switch
#   Add any of the loadrm2 switches you want
# Examples
#   rocketport-upci-firmware.sh -p
#   rocketport-upci-firmware.sh --systemd -p

#ROCKETMODEM II NOTE

#If you are using a RocketModem II board, further installation and
#setup is required.  Note: this does not apply to RocketModem IIs
#boards.

# Load firmware onto all RocketModem II
# The instructions say to load it on all ports but that
# causes long delays.

# sudo sed -e 's:^:#:g' '/proc/tty/driver/rocketupci'
#serinfo:1.0 driver revision:
#0: uart:RP UPCI Plus 4 port RJ45 port:0001B000 irq:18 tx:30 rx:0
#1: uart:RP UPCI Plus 4 port RJ45 port:0001B002 irq:18 tx:30 rx:0
#2: uart:RP UPCI Plus 4 port RJ45 port:0001B004 irq:18 tx:30 rx:0
#3: uart:RP UPCI Plus 4 port RJ45 port:0001B006 irq:18 tx:30 rx:0

#No response from RocketModem on /dev/ttyR0, trying reset...
#No response from RocketModem on /dev/ttyR1, trying reset...
#No response from RocketModem on /dev/ttyR2, trying reset...
#No response from RocketModem on /dev/ttyR3, trying reset...
#No response from RocketModem on /dev/ttyR0, couldn't initialize.
#No response from RocketModem on /dev/ttyR1, couldn't initialize.
#No response from RocketModem on /dev/ttyR2, couldn't initialize.
#No response from RocketModem on /dev/ttyR3, couldn't initialize.

# The right modems are easy to detect.

set -e
set -u

module='rocket'

if [ "${EUID}" -ne 0 ]; then
  echo 'root is required to load firmware'
  exit 1
fi

_opt_systemd=0
if [ "${1:-}" = '--systemd' ]; then
  _opt_systemd=1
  shift
fi

# just in case the boot is too fast
if [ ! -f "/proc/tty/driver/${module}" ]; then
  echo "wait for online: /proc/tty/driver/${module}"
  sleep 5
fi

if readarray -t rockets < "/proc/tty/driver/${module}"; then
  #declare -p rockets
  rocketmodems=()
  for rocket in "${rockets[@]}"; do
    #echo "Checking ${rocket}"
    if [[ "${rocket^^}" =~ ^[0-9]+:.*' PCI RocketModem II ' ]]; then
      rocketmodems+=("/dev/ttyR${rocket%%:*}")
    fi
  done
  if [ "${#rocketmodems[@]}" -ne 0 ]; then
    loadrm2 "$@" "${rocketmodems[@]}"
  fi
fi

if [ "${_opt_systemd}" -ne 0 ]; then
  systemd-notify --ready
fi
