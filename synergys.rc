#!/bin/bash

daemon_name=synergys

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/bin/synergys`
case "$1" in
  start)
    stat_busy "Starting Synergy Server"
    [ -z "$PID" ] && /usr/bin/synergys --config /etc/synergy.conf &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon $daemon_name
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Synergy Server"
    [ ! -z "$PID" ] && kill -9 $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon $daemon_name
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
