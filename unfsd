#!/bin/bash
. /etc/rc.conf
. /etc/rc.d/functions

DAEMON=unfsd
NAME=unfsd
ARGS=

[ -r /etc/conf.d/$NAME.conf ] && . /etc/conf.d/$NAME.conf

PID=$(get_pid $DAEMON)

case "$1" in
	start)
		ck_daemon rpcbind && { echo -n "Start rpcbind first." >&2; stat_die; }
		stat_busy "Starting $NAME"
		[ -z "$PID" ] && /usr/sbin/$DAEMON $ARGS
		if [ $? = 0 ]; then
			add_daemon $NAME
			stat_done
		else
			stat_fail
			exit 1
		fi
		;;
	stop)
		stat_busy "Stopping $NAME"
		[ -n "$PID" ] && kill $PID &>/dev/null
		if [ $? = 0 ]; then
			rm_daemon $NAME
			stat_done
		else
			stat_fail
			exit 1
		fi
		;;
	restart)
		$0 stop
		sleep 1
		$0 start
		;;
	*)
		echo "usage: $0 {start|stop|restart}"  
esac
