#!/bin/bash

CONF=/etc/pmacct/nfacctd.conf

. /etc/rc.conf
. /etc/rc.d/functions

[ -f $CONF ]

PID=$(pidof -o %PPID /usr/sbin/nfacctd)
case "$1" in
  start)
    stat_busy "Starting pmacct NetFlow Accounting Daemon"
    [ -z "$PID" ] && /usr/sbin/nfacctd -f $CONF
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon nfacctd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping pmacct NetFlow Accounting Daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon nfacctd
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
