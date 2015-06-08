#!/bin/bash

# description: Start/Stop firebird database server

# To run more instances of firebird:
#   Copy /opt/firebird somewhere
#   Copy this script under a new name
#   Change INSTANCE and FIREBIRD below (all instance names should be unique)
#   Edit the copied firebird.conf to change at least RemoteServicePort

. /etc/rc.conf
. /etc/rc.d/functions

INSTANCE=default
FIREBIRD=/opt/firebird
DAEMON_NAME=`basename $0`

# No changes needed below for multiple instances
FBRunUser=firebird

makeFbDir() {
	mDir=${1}
	mode=${2}
	if [ ! -d $mDir ]; then
		rm -rf $mDir
		mkdir $mDir
		if [ "$mode" ]; then
			chmod $mode $mDir
		fi
	fi
	chown $FBRunUser:$FBRunUser $mDir
}
runDir=/var/run/firebird
makeFbDir $runDir
lockDir=/tmp/firebird
makeFbDir $lockDir 0770

pidfile="$runDir/$INSTANCE.pid"
FULLNAME="Firebird server [$INSTANCE]"
LD_LIBRARY_PATH=$FIREBIRD/lib

export FIREBIRD LD_LIBRARY_PATH

GUARDIAN=$FIREBIRD/bin/fbguard
if [ ! -x $GUARDIAN ]; then
	GUARDIAN=/opt/firebird/bin/fbguard
fi

# See how we were called.
case "$1" in
  start)
	stat_busy "Starting $FULLNAME"
	echo "$GUARDIAN -pidfile $pidfile -daemon -forever" | su -s /bin/sh $FBRunUser
	#su $FBRunUser "$GUARDIAN -pidfile $pidfile -daemon -forever"
	RETVAL=$?
	if [ $RETVAL -gt 0 ]; then
	  stat_fail
	else
	  add_daemon $DAEMON_NAME
	  stat_done
	fi
	;;
  stop)
	stat_busy "Stopping $FULLNAME"
	RETVAL=1
	if [ -f $pidfile ]; then
	  kill `cat $pidfile`
	  RETVAL=$?
	fi
	if [ $RETVAL -gt 0 ]; then
	  stat_fail
	else
	  rm_daemon $DAEMON_NAME
	  stat_done
	fi
	;;
  status)
	if [ -f $pidfile ]
	then
	  pid=`cat $pidfile`
	  ps -p $pid >/dev/null 2>&1
	  RETVAL=$?
	else
	  RETVAL=1
	fi
	if [ $RETVAL -eq 0 ]
	then
	  echo "$FULLNAME is running, pid $pid"
	else
	  echo "$FULLNAME is stopped."
	fi
	;;
  restart|reload)
	$0 stop
	sleep 1
	$0 start
	;;
  *)
	echo "Usage: firebird {start|stop|status|restart|reload}"
	exit 1
esac

exit 0

