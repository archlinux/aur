#!/bin/sh

# To enable this script, pass it to vdr with the -s option, eg.
# "-s vdr-shutdown.sh" (sans quotes) in VDR_OPTIONS in /etc/sysconfig/vdr.

echo ${1:-0} > /var/run/vdr/next-timer
exec sudo /sbin/shutdown -P now
