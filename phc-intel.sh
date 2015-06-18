#!/bin/bash -e
shopt -s nullglob

if [ "$1" = set ]; then
	. /etc/default/phc-intel
	[ -z "$VIDS" ] && exit
	for i in $(< /proc/cmdline); do
		[ $i = nophc ] && exit
	done
	for i in /sys/devices/system/cpu/cpu*/cpufreq/phc_vids; do
		echo $VIDS > "$i"
	done
	exit
fi

case "$1" in
start)
	. /etc/default/phc-intel
	if [ -z "$VIDS" ]; then
		echo '=> Please edit /etc/default/phc-intel'
		exit 1
	fi
	echo ':: Setting PHC VIDs'
	for i in /sys/devices/system/cpu/cpu*/cpufreq/phc_vids; do
		echo $VIDS > "$i"
	done
	;;
stop)
	echo ':: Resetting default PHC VIDs'
	for i in /sys/devices/system/cpu/cpu*/cpufreq; do
		[ -e "$i/phc_default_vids" -a -e "$i/phc_vids" ] && cp "$i"/phc_{default_,}vids
	done
	;;
status)
	check_off () {
		for i in /sys/devices/system/cpu/cpu*/cpufreq; do
			[ "$(< $i/phc_vids)" = "$(< $i/phc_default_vids)" ] || return;
		done
	}
	check_on () {
		for i in /sys/devices/system/cpu/cpu*/cpufreq/phc_vids; do
			[[ "$(< $i)" =~ "$VIDS" ]] || return;
		done
	}
	echo -n 'PHC status: '
	. /etc/default/phc-intel
	if check_off; then
		echo 'inactive'
	elif check_on; then
		echo 'active'
	else
		echo 'unknown'
	fi
	;;
*)
	echo "usage: $0 {start|stop|status|set}"
esac
