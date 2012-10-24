#!/bin/bash

daemon_name=redis-x32

. /etc/rc.conf
. /etc/rc.d/functions

REDISPORT=6379
EXEC=/usr/bin/redis-server-x32
CLIEXEC=/usr/bin/redis-cli-x32
PIDFILE=/var/run/redis-x32.pid
WORKDIR=/var/lib/redis-x32
CONF="/etc/redis-x32.conf"

# Check if process exists
PID=$(cat $PIDFILE 2>/dev/null)
[ -d /proc/${PID} ] || rm -f $PIDFILE

# Grab the server password, if exists
REDISPASS=`egrep -o '^requirepass ([^#]+)' $CONF | cut -d\  -f 2`
[ -n "$REDISPASS" ] && CLIEXEC="$CLIEXEC -a $REDISPASS"

case "$1" in
  start)
    stat_busy "Starting $daemon_name"
    [ -d $WORKDIR ] || mkdir $WORKDIR

    if [ -f $PIDFILE ]; then
      stat_fail
      exit 1
    else
      $EXEC $CONF >/dev/null
      if [ $? -gt 0 ]; then
        stat_fail
        exit 1
      else
        add_daemon $daemon_name
        stat_done
      fi
    fi
    ;;

  stop)
    stat_busy "Stopping $daemon_name"

    if [ ! -f $PIDFILE ]; then
      stat_fail
      exit 1
    else
      PID=$(cat $PIDFILE)

      # And grab the server address
      REDISADDR=`egrep -o '^bind ([^#]+)' $CONF | cut -d' ' -f2`
      [ -n "$REDISADDR" ] && CLIEXEC="$CLIEXEC -h $REDISADDR"

      $CLIEXEC -p $REDISPORT shutdown
      [ -d /proc/${PID} ] && sleep 1
      [ -d /proc/${PID} ] && sleep 5
      [ -d /proc/${PID} ] && kill -9 $PID
      [ -d /proc/${PID} ] && stat_fail || { stat_done; rm_daemon $daemon_name; }
    fi
    ;;

  restart)
    $0 stop
    sleep 1
    $0 start
    ;;

  status)
    stat_busy "Checking $daemon_name status";
    ck_status $daemon_name
    ;;

  *)
    echo "usage: $0 {start|stop|restart|status}"  
esac
exit 0
