#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

NAME=air-video-server
PIDFILE=/var/run/$NAME.pid
PROPFILE=/etc/conf.d/$NAME

case "$1" in
  start)
    stat_busy "Starting Air Video Server"
    if [ -a $PIDFILE ]; then
      echo "Server already started."
      stat_fail
    else
      /usr/bin/$NAME $PROPFILE &
      if [ $? -gt 0 ]; then
        stat_fail
      else
        add_daemon $NAME
        echo $! > $PIDFILE
        stat_done
      fi
    fi
    ;;
  stop)
    stat_busy "Stopping Air Video Server"
    if [ -a $PIDFILE ]; then
      PID=`cat $PIDFILE`
      kill $PID > /dev/null
      if [ $? -gt 0 ]; then
        stat_fail
      else
        rm $PIDFILE
        rm_daemon $NAME
        stat_done
      fi
    else
      echo "Server not started."
      stat_fail
    fi
    ;;
  restart)
    $0 stop
    sleep 2
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
exit 0
