#!/bin/bash

### /etc/rc.d/gopherd: Initscript for Gopher Daemon

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/gopherd`
case "$1" in
  start)
    stat_busy "Starting Gopher Daemon"
    [ -z "$PID" ] && \
      /usr/sbin/gopherd -d &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else stat_done; add_daemon gopherd
      echo $PID > /var/run/gopherd.pid
    fi ;;
  stop)
    stat_busy "Stopping Gopher Daemon"
    [ ! -z "$PID" ] \
      && kill $PID &>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done; rm_daemon gopherd
    fi ;;
  restart)
    $0 stop
    sleep 1
    $0 start ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac

exit 0

### /etc/rc.d/gopherd: Initscript for Gopher Daemon
