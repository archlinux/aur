#!/bin/sh
# 
# This scripts fix /sys/devices... files permissions for ThinkGui
#

cd /sys/devices/system/cpu
for cpudir in `ls | grep "cpu[[:digit:]]"` ; do
  chmod 666 "$cpudir/cpufreq/scaling_governor"
  chmod 666 "$cpudir/cpufreq/scaling_setspeed"
  chmod 666 "$cpudir/cpufreq/scaling_max_freq"
  chmod 666 "$cpudir/cpufreq/scaling_min_freq"
done

cd /sys/devices/platform/smapi
for batdir in `ls | grep "BAT[[:digit:]]"` ; do
  chmod 666 "$batdir/stop_charge_thresh"
done

