#!/bin/sh

. /etc/rc.d/functions
. /etc/conf.d/libvirtd-guests
. /etc/rc.conf

LIBVIRTD_LISTFILE="/var/state/libvirtd/vm-list"

# list IDs of running guests
libvirt_list()
{
	virsh $LIBVIRTD_URI list | awk 'NR > 2 {print $2}'
}

# suspend guest by name
libvirt_suspend()
{
	virsh $LIBVIRTD_URI $LIBVIRTD_BYPASS_CACHE managedsave "$1" >/dev/null
}

# shutdown guest by name
libvirt_shutdown()
{
	virsh $LIBVIRTD_URI shutdown "$1" >/dev/null
}

# start guest by name
libvirt_start()
{
	virsh $LIBVIRTD_URI $LIBVIRTD_BYPASS_CACHE start "$1" >/dev/null
}

# stop all guests
libvirt_stop_all()
{
	mkdir -p `dirname $LIBVIRTD_LISTFILE`
	echo -n >$LIBVIRTD_LISTFILE
	for i in `libvirt_list`; do
		if [ "x$LIBVIRTD_STOP_ACTION" == "xsuspend" ]; then
			stat_busy "Suspending libvirtd/$i guest"
			libvirt_suspend "$i"
		else
			stat_busy "Shutting libvirtd/$i guest down"
			libvirt_shutdown "$i"
		fi
		[ $? -eq 0 ] && stat_done || stat_fail
		# TODO: check if it does not running
		echo $i >>$LIBVIRTD_LISTFILE
	done
}

# start all guests
libvirt_start_all()
{
	if [ -f $LIBVIRTD_LISTFILE ]; then
		for i in `cat $LIBVIRTD_LISTFILE`; do
			stat_busy "Starting/resuming libvirtd/$i guest"
			libvirt_start "$i"
			[ $? -eq 0 ] && { sleep $LIBVIRTD_START_DELAY; stat_done; } || stat_fail
		done
	fi
	rm -f $LIBVIRTD_LISTFILE
}

# main
case "$1" in
    start)
		libvirt_start_all
		add_daemon libvirtd-guests
	fi
	;;
    stop)
		libvirt_stop_all
		rm_daemon libvirtd-guests
	fi
	;;
    restart)
	$0 stop
	sleep 1
	$0 start
	;;
    *)
        echo $"Usage: $0 {start|stop|restart}"
        ;;
esac
exit 0
