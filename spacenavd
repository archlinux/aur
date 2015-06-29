#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

DAEMON=/usr/bin/spacenavd

PID=`pidof -o %PPID $DAEMON`
case "$1" in
  start)
    stat_busy "Starting Spacenavigator Daemon"
    [ -z "$PID" ] && $DAEMON
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon spacenavd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Spacenavigator Daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon spacenavd
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
