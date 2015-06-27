#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/seeks

PIDFILE="/var/run/seeks.pid"

if [[ -f $PIDFILE ]]; then
  read -r PID < "$PIDFILE"

  # prevent stale pidfiles from hanging around
  if [[ ! -d /proc/$PID ]]; then
    echo 'pid not found. deleteing stale pidfile'
    unset PID
    rm -f "$PIDFILE"
  fi
fi

case "$1" in
  start)
    stat_busy "Starting Seeks"
    if [[ $PID ]]; then
      stat_fail
      exit 1
    fi
    if /usr/bin/seeks --daemon --pidfile "$PIDFILE" --user $SEEKS_USER $SEEKS_ARGS $SEEKS_CONFIG 2>&1 > /dev/null; then
      add_daemon seeks
      stat_done
    else
      stat_fail
      exit 1
    fi
    ;;
  stop)
    stat_busy "Stopping Seeks"
    if [[ ! $PID ]]; then
      stat_fail
      exit 1
    fi
    if { kill $PID && rm -f "$PIDFILE"; } &>/dev/null; then
      rm_daemon seeks
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

