#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

daemon_path=/usr/sbin/soundmodem
daemon_config_path=/etc/conf.d/soundmodem
daemon_name=soundmodem

# source soundmodem daemon settings
SOUNDMODEM_ARGS=
[ -r $daemon_config_path ] && . $daemon_config_path

case "$1" in
    start)
	stat_busy "Starting $daemon_name daemon"
	${daemon_path} ${SOUNDMODEM_ARGS} &>/dev/null &
	if [ $? -ne 0 ]; then
	    stat_die
	else
	    add_daemon $daemon_name
	    stat_done
	fi
	;;
    stop)
	stat_busy "Stopping $daemon_name daemon"
	kill $(pidof $daemon_path) &>/dev/null
	rm_daemon $daemon_name
	stat_done
	;;
    restart)
	stat_busy "Restarting $daemon_name daemon"
	$0 stop
	$0 start
	stat_done
	;;
    status)
	stat_busy "Checking $daemon_name daemon status"
	ck_status $daemon_name
	;;
    *)
	echo "usage: $0 {start|stop|restart|status}"
esac
