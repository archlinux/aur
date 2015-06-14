#!/bin/bash
# vi: ft=sh

NAME=spawn-fcgi-php
CONF="/etc/conf.d/spawn-fcgi-php.conf"
#-------------------------------------------------------------------------------
# Return value for:
# for _check_process
PROCNOPIDEXIST=4                               # none process is running and pidfile exist
PROCNOPIDNO=0                                   # none process is running
PROCRUNPIDEXIST=1                               # process is running, pidfile exist and has size >0b
PROCRUNPID0=2                                   # process is running, pidfile has size 0b
PROCRUNPIDNO=3                                  # process is running, pidfile doesn't exist
OTHERERROR=255
# _check_daemon
DAEMONEXIST=0
DAEMONNOEXIST=1
#-------------------------------------------------------------------------------

# Reading configuration
if [ -r "$CONF" ]; then
	. $CONF
else
	echo "File $CONF not found"
	exit 1
fi
_check_config(){ #{{{
#===  FUNCTION  ================================================================
#          NAME:  _check_config
#   DESCRIPTION:  Check configuration file
#    PARAMETERS:  
#       RETURNS:  0 if all right
#===============================================================================
	# testing DAEMON 
	if [ ! -x "$DAEMON" ]; then
		echo "File $DAEMON isn't executable"
		exit 1
	fi
	# testing USER and GROUP
	if [ -z "$USER" -o -z "$GROUP" ]; then
		echo "The variable USER/GROUP isn't defined. I cann't run process $PHPCGI as root."
		exit 1
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
		echo "The variable PHPCGI isn't defined"
		exit 1
	else
		if [ ! -x "$PHPCGI" ]; then
			echo "The program $PHPCGI isn't executable"
			exit 1
		fi
	fi
	return 0
} #}}}
_check_process(){ #{{{
#===  FUNCTION  ================================================================
#          NAME:  _check_process
#   DESCRIPTION:  Check that process is alive
#    PARAMETERS:  name of process and/or pidfile
#       RETURNS:  look at the beginning of the script
#===============================================================================
	local process pidfile
	if [ $# -eq 2 ]; then
		process=$1
		pidfile=$2
	elif [ $# -eq 1 ]; then
		process=$1
	else
		return $OTHERERROR
	fi

	if pidof $process >/dev/null; then
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
_get_userpid(){ #{{{
#===  FUNCTION  ================================================================
#          NAME:  _get_userpid
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
_check_daemon(){ #{{{
#===  FUNCTION  ================================================================
#          NAME:  _check_daemon
#   DESCRIPTION:  check that daemon exist in directory
#    PARAMETERS:  name of daemon
#       RETURNS:  look at the beginning of the script
#===============================================================================
    echo "Function obsolete"
    return
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
	echo "Checking configuration"
	_check_config || exit 1

	echo "Starting server $NAME" #{{{
    local error
	_check_process $PHPCGI $PIDFILE
	error=$?
	if [ $error -ge $PROCRUNPIDEXIST -a $error -le $PROCRUNPIDNO ]; then
		case $error in
			$PROCRUNPIDEXIST)
				echo "The process $PHP is running"
				;;
			$PROCRUNPID0)
				echo "The process $PHP is running and pidfile has size 0b"
				;;
			$PROCRUNPIDNO)
				echo "The process $PHP is running and pidfile doesn't exist"
				;;
		esac
		exit 1 
	elif [ $error -eq $OTHERERROR ]; then
		echo "Something went wrong..."
		exit 1 $returnvalue
	fi
	
	# run the main daemon
	$DAEMON $OPTIONS >/dev/null
	if [ $? -ne 0 ]; then
		exit 1
	fi
	#}}}
	#{{{ start daemons for multiusers
	if [ -n "$STARTMULTI" ]; then
		echo "Starting server $NAME for multiusers"
		_gen_all_uid
	    local uid gid login group userpidfile usersocket
		if [ -z "$USERSOCKET" ]; then
			# Generate file map user 2 port
			:>$MAPUSER2PORT
			cat >> $MAPUSER2PORT <<- EOF
				# Map username to port
				map \$username \$port {
				default $PORT;

			EOF
			local userport=$PORT
			for uid in ${ALLUID[@]}; do
				login=$(_uid2login $uid)
				if [ $? -eq 0 ]; then
					userport=$((userport+1))
					echo -e "$login $userport;" >> $MAPUSER2PORT
					gid=$(id -g $login)
					group=$(_gid2group $gid)
					if [ -n "$USERPIDFILE" ]; then
						userpidfile=${USERPIDFILE}.${login}.pid
					fi
					USEROPTIONS="-a $IPADDR -p $userport -u $login ${group:+-g $group} -f $PHPCGI -C ${USER_PHP_FCGI_CHILDREN:-1} ${userpidfile:+-P $userpidfile}"
					$DAEMON $USEROPTIONS &>/dev/null
					if [ $? -ne 0 ]; then
						exit 1
					fi
				fi
			done
			echo '}' >> $MAPUSER2PORT
		elif [ -n "$USERSOCKET" ]; then
			for uid in ${ALLUID[@]}; do
				login=$(_uid2login $uid)
				if [ $? -eq 0 ]; then
					gid=$(id -g $login)
					group=$(_gid2group $gid)
					if [ -n "$USERPIDFILE" ]; then
						userpidfile=${USERPIDFILE}.${login}.pid
					fi
					usersocket=${USERSOCKET}.${login}.sock
					USEROPTIONS="-s ${usersocket} -u $login ${group:+-g $group} -f $PHPCGI -C ${USER_PHP_FCGI_CHILDREN:-1} ${userpidfile:+-P $userpidfile}"
					$DAEMON $USEROPTIONS &>/dev/null
					if [ $? -ne 0 ]; then
						exit 1
					fi
				fi
			done
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
	echo "Stopping server $NAME" #{{{
	# for main daemon
	if ! pidof $PHPCGI &>/dev/null; then
		echo "None process $PHPCGI isn't running"
		exit 1
	else
		#process php-cgi is running
		if [ -s "$PIDFILE" ]; then
			# pidfile exists
			kill $(<$PIDFILE)
			if [ $? -eq 0 ]; then
				rm -f $PIDFILE
			else
				exit 1
			fi
		else #pidfile doesn't exist
			if [ -r "$PIDFILE" ]; then
				#pidfile exists and has size 0b
				echo "Pidfile $PIDFILE exists and has size 0b.Removing it"
				rm -f "$PIDFILE" 
			fi
			killall -9 $PHPCGI
			if [ $? -ne 0 ]; then
				exit 1
			fi
		fi
	fi
	#}}}
	#{{{ for multiusers
	if [ -n "$STARTMULTI" ]; then
		# waiting to kill the main daemon
		sleep 1
		if pidof $PHPCGI &>/dev/null; then
			echo "Stopping server $NAME for multiusers"
			killall $PHPCGI
			# cleaning pidfiles
			if [ -n "$USERPIDFILE" ]; then
				_gen_all_uid
				for UserID in ${ALLUID[@]}; do
					local login
                    login=$(_uid2login $UserID)
					if [ $? -eq 0 ]; then
						rm -f ${USERPIDFILE}.${login}.pid
					fi
				done
			fi #$USERPIDFILE
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
	echo "Restarting server $NAME"
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
	if ! pidof $PHPCGI>/dev/null; then
		echo "None process $PHPCGI isn't running"
	else
		echo "Process $PHPCGI is running"
		if [ -s "$PIDFILE" ]; then
			echo "It's spawned by process: $(cat $PIDFILE|tr '\n' ' ')";
		elif [ -r "$PIDFILE" ]; then
			echo "Pidfile $PIDFILE exists but has size 0b"
		else
			echo "Pidfile $PIDFILE doesn't exist"
		fi
		if [ -n "$STARTMULTI" -a -n "$USERSSTATUS" ]; then
			_gen_all_uid
			local uid login userpidfile pid
			for uid in ${ALLUID[@]}; do 
				login=$(_uid2login $uid)
				if [ $? -eq 0 ]; then
					if [ -n "$USERPIDFILE" ]; then
						# USERPIDFILE defined
						userpidfile=${USERPIDFILE}.${login}.pid
						if [ -s "$userpidfile" ]; then
							echo "Process $PHPCGI of user $login is spawned by process: $(cat $userpidfile|tr '\n' ' ')";
						fi
					else
						pid=$(_get_userpid $login $PHPCGI)
						if [ $? -eq 0 ]; then
							echo "Process $PHPCGI for user $login is running and it's spawned by: $pid";
						fi
					fi
				fi
			done
		fi
	fi
} #}}}
_uid2login(){ #{{{
#===  FUNCTION  ================================================================
#          NAME:  _uid2login
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
_gid2group(){ #{{{
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
_gen_all_uid(){ #{{{
#===  FUNCTION  ================================================================
#          NAME:  _gen_all_uid
#   DESCRIPTION:  Generate array of all UID
#    PARAMETERS:  -
#       RETURNS:  -
#===============================================================================
	ALLUID=()
	if [ -n "$RANGEUID" -a ${#RANGEUID[@]} -gt 0 ]; then
		for line in ${RANGEUID[@]/,/ }; do
			(( line )) || exit 1 # not a number
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
			(( line )) || exit 1 #not a number
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
