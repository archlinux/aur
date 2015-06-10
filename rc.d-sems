#!/bin/bash

daemon_name=sems

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/bin/sems`
case "$1" in
  start)
    stat_busy "Starting $daemon_name"
    [ -z "$PID" ] && /usr/bin/sems -f /etc/sems/sems.conf >/dev/null 2>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon sems
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping $daemon_name"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon sems
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
