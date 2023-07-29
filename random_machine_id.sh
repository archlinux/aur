#!/bin/bash

VERSION=20230728.02

set -e # Abort on errors, so that a failing cd does not mess up elsewhere.

while [ "$#" -ge 1 ]; do
  case "$1" in
    '-V'|'--version')
      printf '%s\n' "${VERSION}"
      exit 0
    ;;
    '-h'|'--help')
      printf '%s\n' "See 'cat $0' for what this script does ;-)."
      exit 0
    ;;
  esac
  shift
done


### The idea for the following is taken from https://forum.artixlinux.org/index.php/topic,1547.msg10599.html#msg10599:

if [ -e /etc/machine-id ]; then
  if [ -e /etc/machine-id.prev ]; then
    rm -f /etc/machine-id.prev
  fi
  cp /etc/machine-id /etc/machine-id.prev # Create a backup
  rm -f /etc/machine-id
fi
dbus-uuidgen --ensure=/etc/machine-id

if [ -d /var/lib/dbus ]; then
  if [ -e /var/lib/dbus/machine-id ]; then
    if [ -e /var/lib/dbus/machine-id.prev ]; then
      rm -f /var/lib/dbus/machine-id.prev
    fi
    cp /var/lib/dbus/machine-id /var/lib/dbus/machine-id.prev # Create a backup
    rm -f /var/lib/dbus/machine-id
  fi
  ln -s /etc/machine-id /var/lib/dbus/machine-id
fi
