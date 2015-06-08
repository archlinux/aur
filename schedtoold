#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/bin/schedtoold`
case "$1" in
  start)
    stat_busy "Starting schedtoold"
    [ -z "$PID" ] && /usr/bin/schedtoold
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon schedtoold
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping schedtoold"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon schedtoold
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
