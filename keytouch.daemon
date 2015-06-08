#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=$(pidof -o %PPID /usr/bin/keytouch-acpid)
case "$1" in
  start)
    stat_busy "Starting keyTouch Daemon"
    /usr/bin/keytouch-init
    if [ -z "$PID" ]; then
      /usr/bin/keytouch-acpid &> /dev/null &
    fi
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon keytouch
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping keyTouch Daemon"
    [ ! -z "$PID" ] && kill $PID &>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon keytouch
      stat_done
    fi
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
exit 0
