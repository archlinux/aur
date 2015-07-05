#!/bin/bash

NETWORKMANAGER_BIN=/usr/bin/NetworkManager

# general config
. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID $NETWORKMANAGER_BIN`
case "$1" in
	start)
		ck_daemon dbus && /etc/rc.d/dbus start

		stat_busy "Starting NetworkManager"
		[ ! -d /var/run/NetworkManager ] && install -d /var/run/NetworkManager
		if [ -z "$PID" ]; then
			$NETWORKMANAGER_BIN
		fi
		if [ ! -z "$PID" -o $? -gt 0 ]; then
			stat_fail
		else
			add_daemon networkmanager
			stat_done
		fi
		;;
	stop)
		stat_busy "Stopping NetworkManager"
			[ ! -z "$PID" ] && kill $PID &> /dev/null
		if [ $? -gt 0 ]; then
			stat_fail
		else
			rm_daemon networkmanager
			stat_done
		fi
		;;
	restart)
		$0 stop
		sleep 1
		$0 start
		;;
	sleep)
		/usr/bin/dbus-send --system \
		--dest=org.freedesktop.NetworkManager \
		--type=method_call \
		/org/freedesktop/NetworkManager \
		org.freedesktop.NetworkManager.sleep
		;;
	wake)
		/usr/bin/dbus-send --system \
		--dest=org.freedesktop.NetworkManager \
		--type=method_call \
		/org/freedesktop/NetworkManager \
		org.freedesktop.NetworkManager.wake
		;;
	*)
		echo "usage: $0 {start|stop|restart|sleep|wake}"
		;;
esac
exit 0

