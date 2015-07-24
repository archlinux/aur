#!/bin/bash

CONF=/etc/pmacct/uacctd.conf

. /etc/rc.conf
. /etc/rc.d/functions

[ -f $CONF ]

PID=$(pidof -o %PPID /usr/sbin/uacctd)
case "$1" in
  start)
    stat_busy "Starting pmacct ULOG Accounting Daemon"
    [ -z "$PID" ] && /usr/sbin/uacctd -f $CONF
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon uacctd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping pmacct ULOG Accounting Daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon uacctd
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
