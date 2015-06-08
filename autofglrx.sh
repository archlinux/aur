#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions



LOG="/var/log/catalyst-install.log"

kernel=$(uname -r)
if [ -d "/usr/lib/modules/${kernel}" ]; then
	where_modules="usr/lib/modules"
	elif [ -d "/lib/modules/${kernel}" ]; then
		where_modules="lib/modules"
fi


build_fglrx() {
	rmmod fglrx >/dev/null 2>&1
	/usr/bin/catalyst_build_module "${kernel}" >/dev/null 2>&1
	/usr/bin/catalyst_build_module remove &>> $LOG
	
	
	if [ $? -ne 0 ]
	then
		stat_append "ERROR: see ${LOG} for details"
		stat_die
	fi
}


check_fglrx() {
	compare=$(uname -v)

	if [[ -e /${where_modules}/${kernel}/video/fglrx.ko ]] || [[ -e /${where_modules}/${kernel}/extramodules/fglrx.ko ]] || [[ -e /${where_modules}/${kernel}/video/fglrx.ko.gz ]] || [[ -e /${where_modules}/${kernel}/extramodules/fglrx.ko.gz ]]
	then
		  test=$(modinfo -F description fglrx | grep "__unv:") || stat_die
	else
		return 0
	fi

	if [ "$test" != "__unv:$compare" ]
	then
		return 0
	else
		return 1
	fi
}


load_fglrx() {
	stat_append ": Loading fglrx"
	modprobe fglrx

	if [ $? -ne 0 ]
	then
		stat_die
	else
		stat_done
	fi
}



case "$1" in
  	start)
		stat_busy "Checking fglrx"
		
		
		check_fglrx
		
		if [ $? -eq 0 ]
		then
			stat_append ": Building fglrx "
			build_fglrx
		fi
		
		
		load_fglrx
	;;
	
	stop)
		stat_busy "Unloading fglrx"
		
		
		rmmod fglrx
		
		if [ $? -ne 0 ]
		then
			stat_fail
		else
			stat_done
		fi
	;;
	
	restart)
		$0 stop
		sleep 1
		$0 start
    ;;

	status)
		if [ -n "$(lsmod | grep fglrx)" ]
		then
			stat_busy "Module fglrx is loaded"
			stat_done
		else
			stat_busy "Module fglrx is not loaded"
			stat_fail
		fi
	;;

  	*)
    	echo "Usage: $0 {start|stop|restart|status}"
esac

