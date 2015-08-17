#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/bin/scrobby`
case "$1" in
start)
stat_busy "Starting Scrobby"
/usr/bin/scrobby
if [ $? -gt 0 ]; then
stat_fail
else
stat_done
add_daemon scrobby
fi

;;
stop)
stat_busy "Stoping Scrobby"
[ ! -z "$PID" ] && kill $PID &> /dev/null
if [ $? -gt 0 ]; then
stat_fail
else
stat_done
rm_daemon scrobby
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
