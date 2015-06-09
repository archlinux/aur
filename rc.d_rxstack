#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=$(pidof -o %PPID /usr/bin/rxstack)

stat_started() {
    deltext
    printf "${C_OTHER}[${C_DONE}STARTED${C_OTHER}]${C_CLEAR} \n"
}

stat_stopped() {
    deltext
    printf "${C_OTHER}[${C_DONE}STOPPED${C_OTHER}]${C_CLEAR} \n"
}

case "$1" in
  start)
    stat_busy "Starting Regina Stack"
    [ -z "${PID}" ] && /usr/bin/rxstack -d &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon rxstack
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Regina Stack"
    /usr/bin/rxstack -k &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon rxstack
      stat_done
    fi
    ;;
  status)
    stat_busy "Regina Stack"
    echo -en '\b\b\b\b'
    [ -z "${PID}" ] && stat_stopped
    [ -z "${PID}" ] || stat_started
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|status|restart}"
esac
exit 0
