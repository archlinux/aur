#!/bin/bash

daemon_name=k10ctl
. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
  start)
    stat_busy "Setting CPU Voltages"
    /usr/bin/k10ctl.sh
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      stat_done
    fi
    ;;

  *)
    echo "usage: $0 {start}"
esac

exit 0
