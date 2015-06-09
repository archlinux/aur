#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=$(pidof -o %PPID `which lxdm-binary`)
case "$1" in
  start)
    stat_busy "Starting LXDM Display Manager"
    [ -z "$PID" ] && /usr/sbin/lxdm -d &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon lxdm
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping LXDM Display Manager"
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon lxdm
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 3
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
esac
exit 0
