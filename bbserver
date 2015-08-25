#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID  /usr/bin/bbstored`
case "$1" in
  start)
    stat_busy "Starting BoxBackup Server"
    [ -z "$PID" ] && /usr/bin/bbstored
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon bbserver
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping BoxBackup Server"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon bbserver
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
