#!/bin/bash

VERSION=20230728.01

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

rm -f /etc/machine-id
dbus-uuidgen --ensure=/etc/machine-id

if [ -d /var/lib/dbus ]; then
  rm -f /var/lib/dbus/machine-id
  dbus-uuidgen --ensure=/var/lib/dbus/machine-id
fi
