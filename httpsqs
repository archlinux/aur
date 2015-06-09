#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

DAEMON="httpsqs"
DAEMON_DESC="Simple Queue Service"
#ARGS="-x /home/db/httpsqs"
ARGS="-x /tmp/httpsqs"
PIDFILE=/tmp/httpsqs.pid
PID=`cat $PIDFILE 2>/dev/null`

#[ -r /etc/conf.d/$DAEMON ] && . /etc/conf.d/$DAEMON

case "$1" in
 start)
   stat_busy "Starting $DAEMON_DESC"
   [ -z "$PID" ] && $DAEMON $ARGS & >/dev/null
   if [ $? = 0 ]; then
     add_daemon $DAEMON
     stat_done
   else
     stat_fail
     exit 1
   fi
   ;;
 stop)
   stat_busy "Stopping $DAEMON_DESC"
   [ ! -z "$PID" ]  && kill $PID &> /dev/null
   if [ $? = 0 ]; then
     rm_daemon $DAEMON
     stat_done
   else
     stat_fail
     exit 1
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

