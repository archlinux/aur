#!/bin/bash

source /etc/conf.d/libvirtd-guests
[ -f /etc/rc.conf ] && source /etc/rc.conf

if [ -f /etc/rc.d/functions ]; then
    . /etc/rc.d/functions
else
    stat_busy() {
        echo "$*"
    }

    stat_fail() {
        echo "FAIL"
    }

    stat_done() {
        echo "DONE"
    }

    add_daemon() {
        true
    }

    rm_daemon() {
        true
    }
fi


LIBVIRTD_LISTFILE="/var/state/libvirtd/vm-list"

# get guest state by name
libvirt_get_guest_state()
{
	virsh $LIBVIRTD_URI dominfo "$1" | grep -E '^State:' | awk '{print $2}'
}

# list IDs of running guests
libvirt_list()
{

	list=$(virsh $LIBVIRTD_URI list)

	if [ $? -ne 0 ]; then
		RETVAL=1
		return 1
	fi

	uuids=
	for id in $(echo "$list" | awk 'NR > 2 {print $1}'); do
		uuid=$(virsh $LIBVIRTD_UTI dominfo $id | awk '/^UUID:/{print $2}')
		if [ -z "$uuid" ]; then
			RETVAL=1
			return 1
		fi
		uuids="$uuids $uuid"
	done

	echo $uuids

}

libvirt_domname()
{
	uuid=$1
	name=$(virsh $LIBVIRTD_URI dominfo $uuid | awk 'NR == 2 {$1=""; print}')

	echo $name
}

# suspend guest by name
libvirt_suspend()
{
	virsh $LIBVIRTD_URI $LIBVIRTD_BYPASS_CACHE managedsave "$1" >/dev/null
	timeout=$LIBVIRTD_SHUTDOWN_TIMEOUT
	while [ "$timeout" -gt 0 ]; do
		sleep 1
		timeout=$((timeout - 1))
		state=`libvirt_get_guest_state "$1"`
		[ "x$state" == "xshut" ] && return 0
	done
	return 1
}

# shutdown guest by name
libvirt_shutdown()
{
	virsh $LIBVIRTD_URI shutdown "$1" >/dev/null
	timeout=$LIBVIRTD_SHUTDOWN_TIMEOUT
	while [ "$timeout" -gt 0 ]; do
		sleep 1
		timeout=$((timeout - 1))
		state=`libvirt_get_guest_state "$1"`
		[ "x$state" == "xshut" ] && return 0
	done
	return 1
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
		name=`libvirt_domname $i`
		if [ "x$LIBVIRTD_STOP_ACTION" == "xsuspend" ]; then
			stat_busy "Suspending libvirtd/$name guest"
			libvirt_suspend "$i"
		else
			stat_busy "Shutting libvirtd/$i guest down"
			libvirt_shutdown "$i"
		fi
		[ $? -eq 0 ] && stat_done || stat_fail
		echo $i >>$LIBVIRTD_LISTFILE
	done
}

# start all guests
libvirt_start_all()
{
	if [ -f $LIBVIRTD_LISTFILE ]; then
		for i in `cat $LIBVIRTD_LISTFILE`; do
			name=`libvirt_domname $i`
			stat_busy "Starting/resuming libvirtd/$name guest"
			libvirt_start "$i"
			[ $? -eq 0 ] && { sleep $LIBVIRTD_START_DELAY; stat_done; } || stat_fail
		done
	fi
	rm -f $LIBVIRTD_LISTFILE
}

# main
LC_ALL=C
LANG=C
case "$1" in
    start)
		libvirt_start_all
		add_daemon libvirtd-guests
	;;
    stop)
		libvirt_stop_all
		rm_daemon libvirtd-guests
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
