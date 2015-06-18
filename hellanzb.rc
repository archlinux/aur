#!/bin/bash

# source application-specific settings
[ -f /etc/conf.d/hellanzb ] && . /etc/conf.d/hellanzb

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
	start)
	stat_busy "Starting hellanzb"
	/bin/su - ${HELLANZB_USER} -c " /usr/bin/python2 /usr/bin/hellanzb.py -D -c ${HELLANZB_CONF} &> /dev/null"
	if [ $? -gt 0 ]; then
		stat_fail
	else
		add_daemon hellanzb
		stat_done
	fi
	;;
	stop)
	stat_busy "Stopping hellanzb"
	/bin/su - ${HELLANZB_USER} -c " /usr/bin/python2 /usr/bin/hellanzb.py -c ${HELLANZB_CONF} shutdown &> /dev/null"
	if [ $? -gt 0 ]; then
		stat_fail
	else
		rm_daemon hellanzb
		stat_done
	fi
	;;
	restart)
	$0 stop
	sleep 2
	$0 start
	;;
	*)
	echo "usage: $0 {start|stop|restart}"
esac
exit 0
