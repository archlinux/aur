#!/bin/bash

. /etc/rc.conf
. /etc/conf.d/smcrouted
. /etc/rc.d/functions
 
# smcroute writes its process ID to /var/run/smcroute.pid upon startup.
PIDFILE="/var/run/smcroute.pid"

# Specify the default configuration file '/etc/smcroute.conf'.
[[ -z "$SMCROUTED_CONFFILE" ]] && SMCROUTED_CONFFILE="/etc/smcroute.conf"

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
    stat_busy "Starting SMCRoute Server"
    if [[ $PID ]]; then
      stat_fail
      exit 1
    fi
    if /usr/sbin/smcroute -d -f "$SMCROUTED_CONFFILE" $SMCROUTED_ARGS; then
      add_daemon smcrouted
      stat_done
    else
      stat_fail
      exit 1
    fi
    ;;
  stop)
    stat_busy "Stopping SMCRoute Server"
    if [[ ! $PID ]]; then
      stat_fail
      exit 1
    fi
    if { smcroute -k; } &>/dev/null; then
      rm_daemon smcrouted
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

