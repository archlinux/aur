#!/bin/bash

. /etc/rc.conf
. /etc/conf.d/libvirtd
. /etc/rc.d/functions

LIBVIRTD_CONFIG_ARGS=
if [ -n "$LIBVIRTD_CONFIG" ]
then
	LIBVIRTD_CONFIG_ARGS="--config $LIBVIRTD_CONFIG"
fi

PID=`pidof -o %PPID /usr/sbin/libvirtd`
case "$1" in
    start)
	stat_busy "Starting libvirtd"
	export RADVD=/usr/sbin/radvd
	for i in /var/run/libvirt/qemu /var/run/libvirt/lxc /var/run/libvirt/uml /var/run/libvirt/network; do
		[ -d $i ] || mkdir -p $i
	done
	[ -z "$PID" ] && (
		mkdir -p /var/{cache,run}/libvirt
		rm -rf /var/cache/libvirt/*
		KRB5_KTNAME=$KRB5_KTNAME \
			/usr/sbin/libvirtd --daemon $LIBVIRTD_CONFIG_ARGS $LIBVIRTD_ARGS
	)
	if [ $? -gt 0 ]; then
		stat_fail
	else
		add_daemon libvirtd
		stat_done
	fi
	;;
    stop)
	stat_busy "Stopping libvirtd"
	[ ! -z "$PID" ]  && (
		kill $PID &> /dev/null
		rm -rf /var/cache/libvirt/*
		rm -f /var/run/libvirtd.pid
	)
	if [ $? -gt 0 ]; then
		stat_fail
	else
		rm_daemon libvirtd
		stat_done
	fi
	;;
    restart)
	$0 stop
	sleep 1
	$0 start
	;;
    reload)
	stat_busy "Reloading libvirtd configuration"
	[ ! -z "$PID" ]  && kill -HUP $PID &> /dev/null
	if [ $? -gt 0 ]; then
		stat_fail
	else
		stat_done
	fi
	;;
    *)
        echo $"Usage: $0 {start|stop|restart|reload}"
        ;;
esac
exit 0
