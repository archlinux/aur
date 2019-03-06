#!/bin/bash
# 2012: Seblu was here

. /etc/vbox/vbox.cfg

# Build our device tree
for i in /sys/bus/usb/devices/*; do
  if test -r "$i/dev"; then
    dev="`cat "$i/dev" 2> /dev/null`"
    major="`expr "$dev" : '\(.*\):' 2> /dev/null`"
    minor="`expr "$dev" : '.*:\(.*\)' 2> /dev/null`"
    class="`cat $i/bDeviceClass 2> /dev/null`"
    sh "$INSTALL_DIR/VBoxCreateUSBNode.sh" "$major" "$minor" "$class" 2>/dev/null
  fi
done
# vim:set ts=2 sw=2 ft=sh et:
