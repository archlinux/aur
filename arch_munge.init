#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

daemon_name=munge
USER=munge
[ -x /etc/default/munge ] && . /etc/default/munge

PID=`pidof -o %PPID /usr/bin/munged`
case "$1" in
  start)
  stat_busy "Starting MUNGE daemon"
  VARRUNDIR="/run/munge"
  if [ ! -d "$VARRUNDIR" ]; then
    mkdir -m 755 -p "$VARRUNDIR"
    [ -n "$USER" ] && chown "$USER" "$VARRUNDIR"
  fi
  [ -z "$PID" ] && su "$USER" -c /usr/bin/munged "$DAEMON_ARGS" 2>&1
  if [ $? -gt 0 ] ; then
    stat_fail
  else
    add_daemon $daemon_name                     # create the 'state' dir
    stat_done
  fi
  ;;
  stop)
  stat_busy "Stopping MUNGE daemon"
  [ "$PID" ] && kill $PID &> /dev/null
  if [ $? -gt 0 ]; then
    stat_fail
  else
    rm_daemon $daemon_name                      # remove the 'state' dir
    stat_done
  fi
  ;;
  restart)
  $0 stop
  sleep 5
  $0 start
  ;;
  status)
  stat_busy "Checking MUNGE status"
  ck_status $daemon_name
  ;;
  *)
  echo "usage: $0 {start|stop|restart|status}"
esac
exit 0
