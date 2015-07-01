#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/nginx

PID="/var/run/nginx/nginx.pid"
[ -z "$NGINX_CONFIG" ] && NGINX_CONFIG="/etc/nginx/nginx.conf"

function check_config {
  stat_busy "Checking configuration"
  /usr/sbin/nginx -q -t -c "$NGINX_CONFIG"
  if [ $? -ne 0 ]; then
    stat_die
  else
    stat_done
  fi
}

case "$1" in
  start)
    [ "$_nocheck" ] && check_config
    stat_busy "Starting Nginx"
    if [ -s "$PID" ]; then
      stat_fail
      # probably ;)
      stat_busy "Nginx is already running"
      stat_die
     fi
    /usr/sbin/nginx -c "$NGINX_CONFIG" &>/dev/null
    if [ $? -ne 0 ]; then
      stat_fail
    else
      add_daemon nginx
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Nginx"
    kill -QUIT `cat "$PID"` &>/dev/null
    if [ $? -ne 0 ]; then
      stat_fail
    else
      rm_daemon nginx
      stat_done
    fi
    ;;
  restart)
    check_config
    $0 stop
    sleep 1
    _nocheck=1
    $0 start
    ;;
  reload)
    check_config
    if [ -s "$PID" ]; then
      status "Reloading Nginx Configuration" kill -HUP `cat "$PID"`
    fi
    ;;
  upgrade)
    check_config
    if [ -s "$PID" ]; then
      status "Upgrading Nginx" kill -USR2 `cat "$PID"`
    fi
    sleep 1
    if [ -f "${PID}.oldbin" ]; then
      status "Stopping old Nginx" kill -QUIT `cat "${PID}.oldbin"`
    fi
    ;;
  check)
    check_config
    ;;
  *)
    echo "usage: $0 {start|stop|restart|reload|upgrade|check}"  
esac
