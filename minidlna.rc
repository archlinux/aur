#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/minidlna

pidfile=/var/run/minidlna/minidlna.pid

get_pid() {
    pidof -o %PPID /usr/sbin/minidlnad
}

case "$1" in
  start)
    stat_busy "Starting minidlnad"
    PID=$(get_pid)
    if [[ -z "$PID" ]]; then
      [[ -f $pidfile ]] && rm -f $pidfile
      touch $pidfile && chown $MINIDLNA_USER:$MINIDLNA_USER $pidfile
      mkdir -p /var/cache/minidlna
      chown -R $MINIDLNA_USER /var/cache/minidlna
      su -s /bin/sh -l -c "/usr/sbin/minidlnad ${MINIDLNA_OPTS} $2" - $MINIDLNA_USER
      if [[ $? -gt 0 ]]; then
        stat_fail
        exit 1
      else
        add_daemon minidlnad
        stat_done
      fi
    else
      stat_fail
      exit 1
    fi
    ;;

  stop)
    stat_busy "Stopping minidlnad"
    PID=$(get_pid)
    [[ -n $PID ]] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      rm -f $pidfile &> /dev/null
      rm_daemon minidlnad
      stat_done
    fi
    ;;

  restart)
    $0 stop
    sleep 1
    $0 start
    ;;

  rescan)
    $0 stop
    sleep 1
    $0 start -R
    ;;

  *)
    echo "usage: $0 {start|stop|restart|clean}"
esac
exit 0
