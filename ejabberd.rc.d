#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

cd /var/log/ejabberd/

get_pid() {
    pidof epmd >/dev/null || { echo '' ; return 0; }
    # get port from 'epmd -names', then get pid from 'netstat -tlnp'
    PORT=`epmd -names | grep ejabberd | cut -f5 -d\ `
    [ -z "$PORT" ] && { echo '' ; return 0; }
    PID=`netstat -tlnp | grep $PORT | grep -oE '[[:digit:]]+/'`
    [ -z "$PID" ] && { echo '' ; return 0; }
    echo ${PID%/}
}

case "$1" in
  start)
    stat_busy "Starting ejabber daemon"

    [ -d /var/lock/ejabberdctl ] || mkdir -p /var/lock/ejabberdctl
    [ -f /var/run/ejabber.pid ] && rm -f /var/run/ejabber.pid
    PID=`get_pid`
    if [ -z "$PID" ]; then
      su ejabberd -s /bin/bash - -c 'erl -pa /usr/lib/ejabberd/ebin -sname ejabberd -s ejabberd -ejabberd config \"/etc/ejabberd/ejabberd.cfg\" log_path \"/var/log/ejabberd/ejabberd.log\" -sasl sasl_error_logger \{file,\"/var/log/ejabberd/sasl.log\"\} -mnesia dir \"/var/spool/ejabberd\" -detached -kernel inetrc \"/etc/ejabberd/inetrc\"'
      if [ $? -gt 0 ]; then
        stat_fail
        exit 1
      else
        echo `get_pid` > /var/run/ejabberd.pid
        add_daemon ejabberd
        stat_done
      fi
    else
      stat_fail
      exit 1
    fi
    ;;

  stop)
    stat_busy "Stopping ejabber daemon"
    PID=`get_pid`
    [ ! -z "$PID" ] && su ejabberd -s /bin/bash - -c "kill $PID" &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      rm -f /var/run/ejabberd.pid &> /dev/null
      rm_daemon ejabberd
      stat_done
    fi
    ;;

  restart)
    $0 stop
    sleep 3
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
exit 0
