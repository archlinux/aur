#!/bin/bash

prog=lld2d
#
. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/$prog


case "$1" in
  start)
    stat_busy "Starting LLD2D Daemon"
    $prog $IF $OPTION
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon $prog
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping LLD2D Daemon"
    kill `cat /var/run/$prog-$IF.pid`
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon $prog
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
