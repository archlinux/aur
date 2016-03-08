#!/bin/bash

daemon_name=oml2-server
pidfile=/run/$daemon_name.pid

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/$daemon_name.conf

get_pid() {
  pidof -o %PPID $daemon_name
}

test_pid(){
  if [ -s "$pidfile" ]; then
	if pidof -o %PPID $daemon_name | tr ' ' '\n' | grep -w $(cat $pidfile); then
      return 0
    fi
  fi
  return 1
}

case "$1" in
	start)
		stat_busy "Starting $daemon_name daemon"

		PID=$(get_pid)
		if [[ -z $PID ]]; then
			[[ -f $pidfile ]] &&
				rm -f $pidfile
		# RUN
		$daemon_name $OML2_OPTS & 
		#
		if [[ $? -gt 0 ]]; then
			stat_fail
			exit 1
		else
			echo $(get_pid) > $pidfile
			add_daemon $daemon_name
			stat_done
		fi
		else
			stat_fail
			exit 1
		fi
		;;

	stop)
		stat_busy "Stopping $daemon_name daemon"
		PID=$(get_pid)
		# KILL
		[[ -n $PID ]] && kill $PID &> /dev/null
		#
		if [[ $? -gt 0 ]]; then
			stat_fail
			exit 1
		else
			rm -f $pidfile &> /dev/null
			rm_daemon $daemon_name
			stat_done
		fi
		;;

	restart)
    $0 wait_stop
		$0 start
		;;

	status)
		stat_busy "Checking $daemon_name status";
		ck_status $daemon_name
		;;

  wait_stop)
    pidtmp=$(test_pid) || exit 0
    if kill -0 "${pidtmp:-}" 2> /dev/null; then
      PID=$pidtmp
    fi

    $0 stop

    if [ -n "${PID:-}" ]; then
      i=0
      stat_busy "Waiting for server to terminate"
      while kill -0 "${PID:-}" 2> /dev/null;  do
        if [ $i = '60' ]; then
          stat_fail
          break;
        else
          i=$(($i+1))
          sleep 1
        fi
      done
      stat_done
    fi
    ;;

	*)
		echo "usage: $0 {start|stop|restart|status|wait_stop}"
esac

exit 0

# vim:set ts=2 sw=2 et ft=sh:
