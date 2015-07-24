#!/bin/bash

CONF=/etc/pmacct/sfacctd.conf

. /etc/rc.conf
. /etc/rc.d/functions

[ -f $CONF ]

PID=$(pidof -o %PPID /usr/sbin/sfacctd)
case "$1" in
  start)
    stat_busy "Starting pmacct sFlow Accounting Daemon"
    [ -z "$PID" ] && /usr/sbin/sfacctd -f $CONF
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon sfacctd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping pmacct sFlow Accounting Daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon sfacctd
      stat_done
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
exit 0
