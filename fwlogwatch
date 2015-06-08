#!/bin/bash

# source application-specific settings
[ -f /etc/conf.d/fwlogwatch ] && . /etc/conf.d/fwlogwatch

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/fwlogwatch`
case "$1" in
  start)
    stat_busy "Starting fwlogwatch"
    [ -z "$PID" ] && /usr/sbin/fwlogwatch ${ARGS}
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon fwlogwatch
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping fwlogwatch"
	 [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon fwlogwatch
      stat_done
    fi
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  *)
    echo "usage: `basename $0` {start|stop|restart}"
esac
exit 0
