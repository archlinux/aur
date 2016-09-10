#!/bin/sh

case "$1" in
	1)
		echo 'min_power' | tee /sys/class/scsi_host/*/link_power_management_policy
		echo '1' | tee /sys/module/snd_hda_intel/parameters/power_save_controller \
			/sys/module/*/parameters/power_save 2>/dev/null
		echo 'auto' | tee /sys/bus/*/devices/*/power/control \
			/sys/bus/*/devices/*/device/power/control
		;;

	0)
		echo 'max_performance' | tee /sys/class/scsi_host/*/link_power_management_policy
		echo '0' | tee /sys/module/snd_hda_intel/parameters/power_save_controller \
			/sys/module/*/parameters/power_save 2>/dev/null
		echo 'on' | tee /sys/bus/*/devices/*/power/control \
			/sys/bus/*/devices/*/device/power/control
		;;
esac >/dev/null
