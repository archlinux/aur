#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/bin/clamfs`

case "$1" in
  start)
    # if clamd isn't started first, notifyclamd fails at times
    stat_busy "Starting ClamFS"
    [ -z "$PID" ] && /usr/bin/clamfs /etc/clamav/clamfs.xml > /dev/null

    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon clamfs
      stat_done
    fi
    ;;

  stop)
    stat_busy "Stopping ClamFS"
    [ -n "$PID" ] && kill $PID &> /dev/null

    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon clamfs
      stat_done
    fi
    ;;

  restart)
    $0 stop
    sleep 3
    $0 start
    ;;

  status)
    stat_busy "Checking ClamFS status";
    ck_status clamfs
    ;;

  *)
    echo "usage: $0 {start|stop|restart|status}"  
esac

exit 0

# vim:set ts=2 sw=2 et:
