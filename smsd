#!/bin/bash

if [ "$(whoami)" != "root" ]; then
  echo "You must be root to start/restart/stop services."
  exit 1
fi

. /etc/rc.conf
. /etc/rc.d/functions

DESC="SMS Server Tools 3"

PARAMS=""
USER="smsd"
GROUP="smsd"
RUNDIR="/var/run/smsd"
PIDFILE="$RUNDIR/smsd.pid"
INFOFILE="$RUNDIR/smsd.working"
LOGFILE="/var/log/smsd/smsd.log"

[ -r "/etc/conf.d/smsd" ] && . /etc/conf.d/smsd

PID=`cat $PIDFILE 2>/dev/null`

case "$1" in
  start)
    stat_busy "Starting $DESC"
    [ -n "$USER" ] && PARAMS="-u$USER $PARAMS"
    [ -n "$GROUP" ] && PARAMS="-g$GROUP $PARAMS"
    [ -n "$LOGFILE" ] && PARAMS="-l$LOGFILE $PARAMS"
    if [ -z "$PID" ]; then
      [ -d "$RUNDIR" ] || mkdir "$RUNDIR"
      [ -n "$USER" ] && chown $USER "$RUNDIR"
      [ -n "$GROUP" ] && chgrp $GROUP "$RUNDIR"
      /usr/bin/smsd -n MAINPROCESS -p$PIDFILE -i$INFOFILE $PARAMS
      sleep 1
      PID=`cat $PIDFILE 2>/dev/null`
      if [ -z "$PID" ]; then
        stat_fail
        exit 1
      fi
      add_daemon smsd
      stat_done
    else    
      echo -n "Already running!"
      stat_fail
    fi
    ;;
  stop)
    stat_busy "Stopping $DESC"
    [ -n "$PID" ] && kill $PID &>/dev/null
    if [ $? -gt 0 ]; then
      echo -n "Not started!"
      stat_fail
    else
      rm_daemon smsd
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
