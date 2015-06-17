#!/bin/bash

daemon_name=coova-chilli

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/chilli/functions

DAEMON=/usr/sbin/chilli
NAME=chilli
DESC=chilli
START_CHILLI=1

if [ "$START_CHILLI" != "1" ] ; then
   echo "Chilli default off. Look at /etc/default/chilli"
   exit 0
fi

test -f $DAEMON || exit 0

MULTI=$(ls /etc/chilli/*/chilli.conf 2>/dev/null)
[ -z "$DHCPIF" ] && [ -n "$MULTI" ] && {
    for c in $MULTI; 
    do
	echo "Found configuration $c"
	DHCPIF=$(basename $(echo $c|sed 's#/chilli.conf##'))
	export DHCPIF
	echo "Running DHCPIF=$DHCPIF $0 $*"
	sh $0 $*
    done
    exit
}

if [ -n "$DHCPIF" ]; then
    CONFIG=/etc/chilli/$DHCPIF/chilli.conf
else
    CONFIG=/etc/chilli.conf
fi

[ -f $CONFIG ] || {
    echo "$CONFIG Not found"
    exit 0
}


case "$1" in
  start)
    stat_busy "Starting Coovachilli"
    /sbin/modprobe tun >/dev/null 2>&1
	echo 1 > /proc/sys/net/ipv4/ip_forward
	
	writeconfig
	radiusconfig
	
	test ${HS_ADMINTERVAL:-0} -gt 0 && {	
            (crontab -l 2>&- | grep -v $0
		echo "*/$HS_ADMINTERVAL * * * * $0 radconfig"
		) | crontab - 2>&-
	}

	ifconfig $HS_LANIF 0.0.0.0

    [ ! -d /var/run/coovachilli ] && install -d /var/run/coovachilli
    if $DAEMON start >/dev/null ; then
      add_daemon $daemon_name
      stat_done
    else
      stat_fail
      exit 1
    fi
    ;;

  stop)
    stat_busy "Stopping Coovachilli"
    crontab -l 2>&- | grep -v $0 | crontab -
    if $DAEMON stop >/dev/null ; then
      rm_daemon $daemon_name
      stat_done
    else
      stat_fail
      exit 1
    fi
    ;;

  

  restart)
    stat_busy "Restarting Coovachilli"
    if $DAEMON restart >/dev/null ; then
      add_daemon $daemon_name
      stat_done
    else
      stat_fail
      exit 1
    fi
    ;;
  
  condrestart)
    stat_busy "Restarting Coovachilli"
    if DAEMON restart >/dev/null ; then
      add_daemon $daemon_name
      stat_done
    else
      stat_fail
      exit 1
    fi
    ;;
  
  status)
    stat_busy "Checking Coovachilli status";
    ck_status $daemon_name
    ;;
  
  reload)
    stat_busy "Reloading Coovachilli"
    if $DAEMON graceful >/dev/null ; then
      add_daemon $daemon_name
      stat_done
    else
      stat_fail
      exit 1
    fi
    ;;
   
   radconfig)
	[ -e $MAIN_CONF ] || writeconfig
	radiusconfig
	;;

  

  *)
    echo "usage: $0 {start|stop|restart|condrestart|status|reload|radconfig}"
esac

exit 0
