#!/bin/bash
# vi: ft=sh

. /etc/rc.conf
. /etc/rc.d/functions

NAME=spawn-fcgi-php
CONF="/etc/conf.d/spawn-fcgi-php.conf"
#-------------------------------------------------------------------------------
# Return value for:
# for check_process
PROCNOPIDEXIST=-1                               # none process is running and pidfile exist
PROCNOPIDNO=0                                   # none process is running
PROCRUNPIDEXIST=1                               # process is running, pidfile exist and has size >0b
PROCRUNPID0=2                                   # process is running, pidfile has size 0b
PROCRUNPIDNO=3                                  # process is running, pidfile doesn't exist
OTHERERROR=255
# check_daemon
DAEMONEXIST=0
DAEMONNOEXIST=1
#-------------------------------------------------------------------------------

# Reading configuration
if [ -r "$CONF" ]; then
	. $CONF
else
	stat_fail
	stat_busy "File $CONF not found"
	stat_die
fi
check_config(){ #{{{
#===  FUNCTION  ================================================================
#          NAME:  check_config
#   DESCRIPTION:  Check configuration file
#    PARAMETERS:  
#       RETURNS:  0 if all right
#===============================================================================
	# testing DAEMON 
	if [ ! -x "$DAEMON" ]; then
		stat_fail
		stat_busy "File $DAEMON isn't executable"
		stat_die
	fi
	# testing USER and GROUP
	if [ -z "$USER" -o -z "$GROUP" ]; then
		stat_fail
		stat_busy "The variable USER/GROUP isn't defined. I cann't run process $PHPCGI as root."
		stat_die
	fi
	# testing directory of socket
	if [ -n "$SOCKET" ]; then
		local sockdir=$(dirname "$SOCKET")
		if [ ! -d "$sockdir" ]; then
			mkdir -p "$sockdir"
		fi
	fi
	# testing directory for user's socket
	if [ -n "$USERSOCKET" ]; then
		local socksdir=$(dirname "$USERSOCKET")
		if [ ! -d "$socksdir" ]; then
			mkdir -p "$socksdir"
		fi
	fi
	# testing directory of pidfile
	if [ -n "$PIDFILE" ]; then
		if [ ! -d $(dirname $PIDFILE) ]; then
			mkdir -p $(dirname $PIDFILE)
		fi
	fi
	# testing the program php-cgi
	if [ -z "$PHPCGI" ]; then
		stat_fail
		stat_busy "The variable PHPCGI isn't defined"
		stat_die
	else
		if [ ! -x "$PHPCGI" ]; then
			stat_fail
			stat_busy "The program $PHPCGI isn't executable"
			stat_die
		fi
	fi
	return 0
} #}}}
check_process(){ #{{{
#===  FUNCTION  ================================================================
#          NAME:  check_process
#   DESCRIPTION:  Check that process is alive
#    PARAMETERS:  name of process and/or pidfile
#       RETURNS:  look at the beginning of the script
#===============================================================================
	local process
	local pidfile
	if [ $# -eq 2 ]; then
		process=$1
		pidfile=$2
	elif [ $# -eq 1 ]; then
		process=$1
	else
		return $OTHERERROR
	fi

	if get_pid $process >/dev/null; then
		# process is running
		if [ -s "$pidfile" ]; then
			return $PROCRUNPIDEXIST
		elif [ -r "$pidfile" ]; then
			return $PROCRUNPID0
		else
			return $PROCRUNPIDNO
		fi
	else
		# process doesn't runnig
		if [ -r "$pidfile" ]; then
			return $PROCNOPIDEXIST
		else
			return $PROCNOPIDNO
		fi
	fi
} #}}}
get_userpid(){ #{{{
#===  FUNCTION  ================================================================
#          NAME:  get_userpid
#   DESCRIPTION:  looking for pid of process belong to user
#    PARAMETERS:  name of user, name of process
#       RETURNS:  pid of process or 1 if error
#===============================================================================
	local user=$1
	local process=$2
	if [ -n "$user" -a -n "$process" ]; then
		local pid=$(ps aux | \
			awk -vuser=$user -vprocess=$process \
			'$1 == user && $8 ~ "s" && $11 == process {print $2}')
		if [[ "$pid" =~ ^[0-9]+$ ]]; then
			echo $pid
		else
			return 1
		fi
	else
		return 1
	fi
} #}}}
check_daemon(){ #{{{
#===  FUNCTION  ================================================================
#          NAME:  check_daemon
#   DESCRIPTION:  check that daemon exist in directory
#    PARAMETERS:  name of daemon
#       RETURNS:  look at the beginning of the script
#===============================================================================
	if ck_daemon $NAME; then
		return $DAEMONEXIST
	else
		return $DAEMONEXIST
	fi
} #}}}
start(){ #{{{
#===  FUNCTION  ================================================================
#          NAME:  start
#   DESCRIPTION:  check configuration, if a process is already running and running php-cgi daemon
#    PARAMETERS:  -
#       RETURNS:  -
#===============================================================================
	stat_busy "Checking configuration"
	check_config &&
		stat_done || \
		stat_die

	stat_busy "Starting server $NAME" #{{{
    local error
	check_process $PHPCGI $PIDFILE
	error=$?
	if [ $error -ge $PROCRUNPIDEXIST -a $error -le $PROCRUNPIDNO ]; then
		stat_fail
		case $error in
			$PROCRUNPIDEXIST)
				stat_busy "The process $PHP is running"
				;;
			$PROCRUNPID0)
				stat_busy "The process $PHP is running and pidfile has size 0b"
				;;
			$PROCRUNPIDNO)
				stat_busy "The process $PHP is running and pidfile doesn't exist"
				;;
		esac
		stat_die $error
	elif [ $error -eq $OTHERERROR ]; then
		stat_fail 
		stat_busy "Something went wrong..."
		stat_die $returnvalue
	fi
	
	# run the main daemon
	$DAEMON $OPTIONS >/dev/null
	if [ $? -eq 0 ]; then
		add_daemon $NAME
		stat_done
	else
		stat_die
	fi
	#}}}
	#{{{ start daemons for multiusers
	if [ -n "$STARTMULTI" ]; then
		stat_busy "Starting server $NAME for multiusers"
		gen_all_uid
		if [ -z "$USERSOCKET" ]; then
			# Generate file map user 2 port
			:>$MAPUSER2PORT
			cat >> $MAPUSER2PORT <<- EOF
				# Map username to port
				map \$username \$port {
				default $PORT;

			EOF
			local userport=$PORT
			local uid gid login group userpidfile
			for uid in ${ALLUID[@]}; do
				login=$(uid2login $uid)
				if [ $? -eq 0 ]; then
					userport=$((userport+1))
					echo -e "$login $userport;" >> $MAPUSER2PORT
					gid=$(id -g $login)
					group=$(gid2group $gid)
					if [ -n "$USERPIDFILE" ]; then
						userpidfile=${USERPIDFILE}.${login}.pid
					fi
					USEROPTIONS="-a $IPADDR -p $userport -u $login ${group:+-g $group} -f $PHPCGI -C ${USER_PHP_FCGI_CHILDREN:-1} ${userpidfile:+-P $userpidfile}"
					$DAEMON $USEROPTIONS &>/dev/null
					if [ $? -ne 0 ]; then
						stat_die
					fi
				fi
			done
			echo '}' >> $MAPUSER2PORT
			stat_done
		elif [ -n "$USERSOCKET" ]; then
			local uid gid login group userpidfile usersocket
			for uid in ${ALLUID[@]}; do
				login=$(uid2login $uid)
				if [ $? -eq 0 ]; then
					gid=$(id -g $login)
					group=$(gid2group $gid)
					if [ -n "$USERPIDFILE" ]; then
						userpidfile=${USERPIDFILE}.${login}.pid
					fi
					usersocket=${USERSOCKET}.${login}.sock
					USEROPTIONS="-s ${usersocket} -u $login ${group:+-g $group} -f $PHPCGI -C ${USER_PHP_FCGI_CHILDREN:-1} ${userpidfile:+-P $userpidfile}"
					$DAEMON $USEROPTIONS &>/dev/null
					if [ $? -ne 0 ]; then
						stat_die
					fi
				fi
			done
			stat_done
		fi
	fi
	#}}}
} #}}}
stop(){ #{{{
#===  FUNCTION  ================================================================
#          NAME:  stop
#   DESCRIPTION:  check whether a process is running, stop the daemon php-cgi
#    PARAMETERS:  -
#       RETURNS:  -
#===============================================================================
	stat_busy "Stopping server $NAME" #{{{
	# for main daemon
	if ! get_pid $PHPCGI &>/dev/null; then
		stat_fail
		stat_busy "None process $PHPCGI isn't running"
		stat_die
	else
		#process php-cgi is running
		if [ -s "$PIDFILE" ]; then
			# pidfile exists
			kill $(<$PIDFILE)
			if [ $? -eq 0 ]; then
				rm -f $PIDFILE
				rm_daemon $NAME
				stat_done
			else
				stat_die
			fi
		else #pidfile doesn't exist
			if [ -r "$PIDFILE" ]; then
				#pidfile exists and has size 0b
				stat_busy "Pidfile $PIDFILE exists and has size 0b.Removing it"
				rm -f "$PIDFILE" && \
					stat_done || \
					stat_fail
			fi
			killall -9 $PHPCGI
			if [ $? -eq 0 ]; then
				stat_done
				rm_daemon $NAME
			else
				stat_die
			fi
		fi
	fi
	#}}}
	#{{{ for multiusers
	if [ -n "$STARTMULTI" ]; then
		# waiting to kill the main daemon
		sleep 1
		if get_pid $PHPCGI &>/dev/null; then
			stat_busy "Stopping server $NAME for multiusers"
			killall $PHPCGI
			# cleaning pidfiles
			if [ -n "$USERPIDFILE" ]; then
				gen_all_uid
                local login
				for UserID in ${ALLUID[@]}; do
					login=$(uid2login $UserID)
					if [ $? -eq 0 ]; then
						rm -f ${USERPIDFILE}.${login}.pid
					fi
				done
			fi #$USERPIDFILE
			stat_done
		fi
	fi
	#}}}
} #}}}
restart(){ #{{{
#===  FUNCTION  ================================================================
#          NAME:  restart
#   DESCRIPTION:  stop and start service
#    PARAMETERS:  -
#       RETURNS:  -
#===============================================================================
	stat_busy "Restarting server $NAME"
	stop
	sleep 1
	start
} #}}}
status(){ #{{{
#===  FUNCTION  ================================================================
#          NAME:  status
#   DESCRIPTION:  check status of service
#    PARAMETERS:  -
#       RETURNS:  -
#===============================================================================
	if ! get_pid $PHPCGI>/dev/null; then
		stat_busy "None process $PHPCGI isn't running"
		stat_done
	else
		stat_busy "Process $PHPCGI is running"
		stat_done
		if [ -s "$PIDFILE" ]; then
			stat_busy "It's spawned by process: $(cat $PIDFILE|tr '\n' ' ')";
			stat_done
		elif [ -r "$PIDFILE" ]; then
			stat_fail
			stat_busy "Pidfile $PIDFILE exists but has size 0b"
		else
			stat_busy "Pidfile $PIDFILE doesn't exist"
			stat_done
		fi
		if [ -n "$STARTMULTI" -a -n "$USERSSTATUS" ]; then
			gen_all_uid
			local uid login userpidfile pid
			for uid in ${ALLUID[@]}; do 
				login=$(uid2login $uid)
				if [ $? -eq 0 ]; then
					if [ -n "$USERPIDFILE" ]; then
						# USERPIDFILE defined
						userpidfile=${USERPIDFILE}.${login}.pid
						if [ -s "$userpidfile" ]; then
							stat_busy "Process $PHPCGI of user $login is spawned by process: $(cat $userpidfile|tr '\n' ' ')";
							stat_done
						fi
					else
						pid=$(get_userpid $login $PHPCGI)
						if [ $? -eq 0 ]; then
							stat_busy "Process $PHPCGI for user $login is running and it's spawned by: $pid";
							stat_done
						fi
					fi
				fi
			done
		fi
	fi
} #}}}
uid2login(){ #{{{
#===  FUNCTION  ================================================================
#          NAME:  uid2login
#   DESCRIPTION:  convert uid to username
#    PARAMETERS:  uid
#       RETURNS:  name of user for uid
#===============================================================================
	local uid=$1
	if [ ! $uid -gt 0 ]; then
		return 1
	fi
	local username=$(getent passwd | awk -vuid=$uid -F: '$3 == uid {print $1}')
	if [ -z "$username" ]; then 
		return 1
	else
		echo $username
	fi
} #}}}
gid2group(){ #{{{
	#===  FUNCTION  ================================================================
	#          NAME:  uid2group
	#   DESCRIPTION:  convert gid to name of group
	#    PARAMETERS:  gid
	#       RETURNS:  name of group for gid
	#===============================================================================
	local gid=$1
	if [ ! $gid -gt 0 ]; then
		return 1
	fi
	local groupname=$(getent group | awk -vgid=$1 -F: '$3 == gid {print $1}')
	if [ -z "$groupname" ]; then
		return 1
	else
		echo $groupname
	fi
} #}}}
gen_all_uid(){ #{{{
#===  FUNCTION  ================================================================
#          NAME:  gen_all_uid
#   DESCRIPTION:  Generate array of all UID
#    PARAMETERS:  -
#       RETURNS:  -
#===============================================================================
	ALLUID=()
	if [ -n "$RANGEUID" -a ${#RANGEUID[@]} -gt 0 ]; then
		for line in ${RANGEUID[@]/,/ }; do
			(( line )) || stat_die # not a number
			if [[ ${line/-/} != $line ]]; then
				for ((i=${line%-*}; i<=${line#*-}; i++)); do
					ALLUID+=($i)
				done
			else
				ALLUID+=($line)
			fi
		done
	elif [ $FIRSTUID -gt 1 -a $LASTUID -gt 1 -a $LASTUID -ge $FIRSTUID ]; then
		for ((line=FIRSTUID; line<=LASTUID; line++)); do
			(( line )) || stat_die #not a number
			ALLUID+=($line)
		done
	else
		echo "Error: Wrong range UID. Change RANGEUID or FIRSTUID and LASTUID"
		exit 1
	fi
} #}}}
case $1 in
	start)
		start
		;;
	stop)
		stop
		;;
	restart)
		restart
		;;
	status)
		status
		;;
	*)
		echo "Usage: $0 start|stop|restart|status"
esac
