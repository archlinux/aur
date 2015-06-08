#!/bin/bash

# source application-specific settings
MANSERVER_ARGS=

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pgrep manServer`
case "$1" in
  start)
    stat_busy "Starting ManServer"
    [ -z "$PID" ] && /usr/bin/manserver ${MANSERVER_ARGS}
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon manserver
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping ManServer"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon manserver
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
