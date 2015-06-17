#!/bin/bash

PATH=/usr/sbin:/usr/bin:/sbin:/bin:/opt/java/jre/bin
DESC="supersonic server"
NAME=supersonic
PIDFILE=/var/run/$NAME.pid
DAEMON=/var/supersonic/supersonic.sh
DAEMON_ARGS="--pidfile=$PIDFILE"

. /etc/rc.conf
. /etc/rc.d/functions

PID=$(ps ax |grep java |grep subsonic |awk '{ print $1 }')
case "$1" in
  start)
    if [ ! -z "$PID" ]; then
      stat_fail
    else
       stat_busy "Starting $NAME..."
       $DAEMON $DAEMON_ARGS start&>/dev/null
       if [ $? -gt 0 ]; then
         stat_fail
        else
         add_daemon $NAME
         sleep 2
         stat_done
       fi
    fi
    ;;
  stop)
    stat_busy "Stopping $NAME..."
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
      [ ! -z "$PID" ] && kill $PID &> /dev/null
      if [ $? -gt 0 ]; then
         stat_fail
      else
         stat_done
      fi
    fi
    ;;
  restart|force-reload)
    $0 stop
    sleep 1
    $0 start
    ;;
esac
exit 0
