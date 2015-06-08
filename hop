#!/bin/bash

HOP_OPTS=-v2
HOP=/usr/bin/hop
HOP_PORT=8080

. /etc/rc.conf
. /etc/rc.d/functions

if [ -f /etc/conf.d/hop ]; then
  . /etc/conf.d/hop
fi

case "$1" in
  start)
    stat_busy "Starting Hop service"
    $HOP -p $HOP_PORT --accept-kill $HOP_OPTS &> /dev/null 2> /var/log/hop.log &
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon hop
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Hop service"
    $HOP -p $HOP_PORT --kill &> /dev/null &
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon hop
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
    ;;
esac
