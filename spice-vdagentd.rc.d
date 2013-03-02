#!/bin/bash

daemon_name="spice-vdagentd"

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/$daemon_name.conf

get_pid() {
	pidof -o %PPID $daemon_name
}

case "$1" in
	start)
		stat_busy "Starting $daemon_name daemon"

		PID=$(get_pid)
		if [[ -z $PID ]]; then
			[[ -f /var/run/$daemon_name.pid ]] &&
				rm -f /var/run/$daemon_name.pid
    [[ -d /var/run/spice-vdagentd ]] || install -dm 0755 /var/run/spice-vdagentd
		rm -f /var/run/spice-vdagentd/spice-vdagent-sock
		# RUN
		$daemon_name ${SPICE_VDAGENTD_ARGS}
		#
		if [[ $? -gt 0 ]]; then
			stat_fail
			exit 1
		else
			echo $(get_pid) > /var/run/$daemon_name.pid
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
			rm -f /var/run/$daemon_name.pid &> /dev/null
			rm_daemon $daemon_name
			stat_done
		fi
		;;

	restart)
		$0 stop
		sleep 3
		$0 start
		;;

	status)
		stat_busy "Checking $daemon_name status";
		ck_status $daemon_name
		;;

	*)
		echo "usage: $0 {start|stop|restart|status}"
esac

exit 0

# vim:set ts=2 sw=2 et:
