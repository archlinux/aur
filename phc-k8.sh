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
	. /etc/default/phc-k8
	if check_off; then
		echo 'inactive'
	elif check_on; then
		echo 'active'
	else
		echo 'unknown'
	fi
	;;
setup)
	echo ':: Removing old phc-k8 modules'
	echo
	for i in /usr/lib/modules/*; do
		if [ -f "$i/phc-k8.ko" -a ! -f "$i/version" ]; then
			rm -f "$i"/{mperf,phc-k8}.ko
			rmdir --ignore-fail-on-non-empty "$i"
		elif [ -d "$i/updates/kernel/arch/x86/kernel/cpu/cpufreq" -a ! -d "$i/kernel" ]; then
			rm -f "$i"/updates/kernel/arch/x86/kernel/cpu/cpufreq/{mperf,phc-k8}.ko
			rmdir -p --ignore-fail-on-non-empty "$i/updates/kernel/arch/x86/kernel/cpu/cpufreq"
		fi
	done
	echo ':: Compiling new phc-k8 module'
	echo
	cd /usr/src/phc-k8/
	make
	echo
	echo ':: Installing new phc-k8 module'
	echo
	make install
	echo
	echo ':: Cleaning up'
	echo
	make clean
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
	echo "usage: $0 {start|stop|status|setup|set}"
esac
