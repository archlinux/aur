#!/bin/bash
#
# plptools        Starts ncpd/plpfuse.
#
# chkconfig: 2345 45 10
# description: This facility enables connectivity to an EPOC PDA.

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/plptools

NCPD_PIDFILE=/var/run/plptools/ncpd.pid
NCPD_PID=$(cat $NCPD_PIDFILE 2>/dev/null)
if ! readlink -q /proc/$NCPD_PID/exe | grep -q '^/usr/bin/ncpd'; then
	NCPD_PID=
	rm $NCPD_PIDFILE 2>/dev/null
fi

PLPFUSE_PIDFILE=/var/run/plptools/plpfuse.pid
PLPFUSE_PID=$(cat $PLPFUSE_PIDFILE 2>/dev/null)
if ! readlink -q /proc/$PLPFUSE_PID/exe | grep -q '^/usr/bin/plpfuse'; then
	PLPFUSE_PID=
	rm $PLPFUSE_PIDFILE 2>/dev/null
fi

PLPPRINTD_PIDFILE=/var/run/plptools/plpprintd.pid
PLPPRINTD_PID=$(cat $PLPPRINTD_PIDFILE 2>/dev/null)
if ! readlink -q /proc/$PLPPRINTD_PID/exe | grep -q '^/usr/bin/plpprintd'; then
	PLPPRINTD_PID=
	rm $PLPPRINTD_PIDFILE 2>/dev/null
fi

start() {
	echo "Starting EPOC support ..."
	RETVAL=0
	if [ ! -x /var/run/plptools ] ; then
		install -m755 -d /var/run/plptools
	fi
	if test "$START_NCPD" = "yes" ; then
		stat_busy "  ncpd: "
		[[ -z $NCPD_PID ]] && /usr/bin/ncpd $NCPD_ARGS
		if [[ $? -gt 0 ]]; then
			RETVAL=1
			stat_fail
		else
			PID=`pidof -o %PPID /usr/bin/ncpd`
			echo $PID > $NCPD_PIDFILE 2>/dev/null
			add_daemon ncpd
			stat_done
		fi
	fi
        if [ $RETVAL -eq 0 ] ; then
		if test "$START_PLPFUSE" = "yes" ; then
			stat_busy "  plpfuse: "
			[[ -z $PLPFUSE_PID ]] && /usr/bin/plpfuse $PLPFUSE_ARGS $PLPFUSE_MOUNTPOINT
			if [[ $? -gt 0 ]]; then
				RETVAL=1
				stat_fail
			else
				PID=`pidof -o %PPID /usr/bin/plpfuse`
				echo $PID > $PLPFUSE_PIDFILE 2>/dev/null
				add_daemon plpfuse
				stat_done
			fi
		fi
	fi
	if [ $RETVAL -eq 0 ] ; then
		if test "$START_PLPPRINTD" = "yes" ; then
			stat_busy "  plpprintd: "
			[[ -z $PLPPRINTD_PID ]] && /usr/bin/plpprintd $PLPPRINTD_ARGS
			if [[ $? -gt 0 ]]; then
				RETVAL=1
				stat_fail
			else
				PID=`pidof -o %PPID /usr/bin/plpprintd`
				echo $PID > $PLPPRINTD_PIDFILE 2>/dev/null
				add_daemon plpprintd
				stat_done
			fi
		fi
	fi
	[ $RETVAL -eq 0 ] && touch /var/lock/plptools
}

stop() {
	echo "Stopping EPOC support ..."
	RETVAL=0
	if test "$START_PLPPRINTD" = "yes" ; then
		stat_busy "  plpprintd: "
		[[ ! -z $PLPPRINTD_PID ]] && kill $PLPPRINTD_PID &> /dev/null
		if [[ $? -gt 0 ]]; then
			stat_fail
		else
			rm $PLPPRINTD_PIDFILE &>/dev/null
			rm_daemon plpprintd
			stat_done
		fi
	fi
	if test "$START_PLPFUSE" = "yes" ; then
		stat_busy "  plpfuse: "
		[[ ! -z $PLPFUSE_PID ]] && fusermount -u $PLPFUSE_MOUNTPOINT &> /dev/null
		if [[ $? -gt 0 ]]; then
			stat_fail
		else
			rm $PLPFUSE_PIDFILE &>/dev/null
			rm_daemon plpfuse
			stat_done
		fi
	fi
	if test "$START_NCPD" = "yes" ; then
		stat_busy "  ncpd: "
		[[ ! -z $NCPD_PID ]] && kill $NCPD_PID &> /dev/null
		if [[ $? -gt 0 ]]; then
			RETVAL=1
			stat_fail
		else
			rm $NCPD_PIDFILE &>/dev/null
			rm_daemon ncpd
			stat_done
		fi
		echo
	fi
	[ $RETVAL -eq 0 ] && rm -f /var/lock/plptools
}

restart() {
	stop
	start
}

# See how we were called.
case "$1" in
  start)
  	start
	;;
  stop)
  	stop
	;;
  status)
	status ncpd
	status plpprintd
	;;
  restart|reload)
  	restart
	;;
  condrestart)
  	test -f /var/lock/plptools && restart || :
	;;
  *)
	echo "Usage: plptools {start|stop|status|restart|reload|condrestart}"
esac
exit 0
