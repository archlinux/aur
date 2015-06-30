#!/bin/bash

# general config

NGINX_CONFIG="/etc/nginx/nginx.conf"

. /etc/conf.d/nginx
. /etc/rc.conf
. /etc/rc.d/functions

function check_config {
  stat_busy "Checking configuration"
  /usr/bin/nginx -t -q -c "$NGINX_CONFIG"
  if [ $? -ne 0 ]; then
    stat_die
  else
    stat_done
  fi
}

case "$1" in
  start)
    check_config
    $0 careless_start
    ;;
  careless_start)
    stat_busy "Starting Nginx"
    if [ -s /run/nginx.pid ]; then
      stat_fail
      # probably ;)
      stat_busy "Nginx is already running"
      stat_die
     fi
    /usr/bin/nginx -c "$NGINX_CONFIG" &>/dev/null
    if [ $? -ne 0 ]; then
      stat_fail
    else
      add_daemon nginx
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Nginx"
    NGINX_PID=`cat /run/nginx.pid 2>/dev/null`
    kill -QUIT $NGINX_PID &>/dev/null
    if [ $? -ne 0 ]; then
      stat_fail
    else
      for i in `seq 1 10`; do
        [ -d /proc/$NGINX_PID ] || { stat_done; rm_daemon nginx; exit 0; }
        sleep 1
      done
      stat_fail
    fi
    ;;
  restart)
    check_config
    $0 stop
    sleep 1
    $0 careless_start
    ;;
  reload)
    check_config
    if [ -s /run/nginx.pid ]; then
      status "Reloading Nginx Configuration" kill -HUP `cat /run/nginx.pid`
    fi
    ;;
  check)
    check_config
    ;;
  *)
    echo "usage: $0 {start|stop|restart|reload|check|careless_start}"
esac
