#!/bin/bash -e
shopt -s nullglob

case "$1" in
start)
	. /etc/default/phc-k8
	if [ -z "$VIDS" ]; then
		echo '=> Please edit /etc/default/phc-k8'
		exit 1
	fi
	echo ':: Setting PHC VIDs'
	for i in /sys/devices/system/cpu/cpu*/cpufreq/phc_vids; do
		echo $VIDS > "$i"
	done
	;;
stop)
	echo ':: Resetting default PHC VIDs'
	for i in /sys/devices/system/cpu/cpu*/cpufreq/phc_vids; do
		cp "${i%vids}default_vids" "$i"
	done
	;;
status)
	check_off () {
		for i in /sys/devices/system/cpu/cpu*/cpufreq/phc_vids; do
			[ "$(< "$i")" = "$(< "${i%vids}default_vids")" ] || return;
		done
	}
	check_on () {
		for i in /sys/devices/system/cpu/cpu*/cpufreq/phc_vids; do
			[[ "$(< "$i")" =~ "$VIDS" ]] || return;
		done
	}
	echo -n 'PHC status: '
	. /etc/default/phc-k8
	if check_off; then
		echo 'inactive'
	elif check_on; then
		echo 'active'
	else
		echo 'unknown'
	fi
	;;
set)
	. /etc/default/phc-k8
	[ -z "$VIDS" ] && exit
	for i in $(< /proc/cmdline); do
		[ $i = nophc ] && exit
	done
	for i in /sys/devices/system/cpu/cpu*/cpufreq/phc_vids; do
		echo $VIDS > "$i"
	done
	;;
*)
	echo "usage: $0 {start|stop|status|set}"
esac
