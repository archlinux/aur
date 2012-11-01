#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

name=bitlbee
PID=$(pidof -o %PPID /usr/sbin/bitlbee)
install -o bitlbee -g bitlbee -d -m 755 /var/run/bitlbee

case "$1" in
start)
	stat_busy "Starting $name daemon"
	[[ -z "$PID" ]] && {
		rm -f /var/run/bitlbee/bitlbee.pid
		su -s /bin/sh -c '/usr/sbin/bitlbee -F' bitlbee
	} && {
		add_daemon $name
		stat_done
	} || { stat_fail; exit 1; }
	;;
stop)
	stat_busy "Stopping $name daemon"
	[[ -n "$PID" ]] && {
		kill $PID &>/dev/null
	} && {
		rm -f /var/run/bitlbee/bitlbee.pid
		rm_daemon $name
		stat_done
	} || { stat_fail; exit 1; }
	;;
restart)
	$0 stop
	sleep 3
	$0 start
	;;
*)
	echo "usage: $0 {start|stop|restart}"
	exit 1
	;;
esac
