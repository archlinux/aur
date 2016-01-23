#!/bin/bash

source /etc/conf.d/minecraft || echo "Could not source /etc/conf.d/minecraft"

# You may use this script for any minecraft server of your choice, just alter the config file
SERVER_ROOT="${SERVER_ROOT:-/srv/minecraft}"
BACKUPPATH="${BACKUPPATH:-/srv/minecraft/backup}"
LOGPATH="${LOGPATH:-/srv/minecraft/logs}"
WORLDPATHS="${WORLDPATHS:-world}"
KEEP_BACKUPS="${KEEP_BACKUPS:-10}"
MC_USER="${MC_USER:-minecraft}"
MAIN_JAR="${MAIN_JAR:-minecraft_server.jar}"
SESSION_NAME="${SESSION_NAME:-minecraft}"

# Specify system parameters for the minecraft server
MINHEAP="${MINHEAP:-512M}"
MAXHEAP="${MAXHEAP:-1024M}"
THREADS="${THREADS:-1}"
JAVA_PARMS="${JAVA_PARMS:-"-Xmx${MAXHEAP} -Xms${MINHEAP} -XX:ParallelGCThreads=${THREADS}"}"

# Check for sudo rigths
if [ $(sudo whoami) != "root" ]; then
	echo "You must have sudo access in order to use this script."
	exit 1
fi

# Pipe any given argument to the minecraft server console
mc_command() {
	sudo -u "${MC_USER}" screen -S "${SESSION_NAME}" -X stuff "`printf \"$*\r\"`"
}

# Start the server if it is not already running
server_start() {
	sudo -u "${MC_USER}" screen -S "${SESSION_NAME}" -Q select . > /dev/null
	if [ $? -eq 0 ]; then
		echo "A screen ${SESSION_NAME} session is already running. Please close it first."
	else
		echo -en "Starting server... "
		sudo -u "${MC_USER}" screen -dmS "${SESSION_NAME}" /bin/bash -c "cd '${SERVER_ROOT}'; java ${JAVA_PARMS} -jar '${SERVER_ROOT}/${MAIN_JAR}' nogui"
		echo -e "\e[39;1m done\e[0m"
	fi
}

# Stop the server gracefully by saving everything prior and warning the users
server_stop() {
	sudo -u "${MC_USER}" screen -S "${SESSION_NAME}" -Q select . > /dev/null
	if [ $? -eq 0 ]; then
		mc_command save-all
		mc_command say "Server is going down in 10 seconds! HURRY UP WITH WATHEVER YOU ARE DOING!" # Warning the users
		echo -en "Server is going down in... "
		for i in $(seq 1 10); do
			mc_command say "down in... $(expr 10 - $i)"
			echo -n " $(expr 10 - $i)"
			sleep 1
		done
		mc_command stop
		echo -e "\e[39;1m done\e[0m"
	else
		echo "The corresponding screen session for ${SESSION_NAME} was already dead."
	fi
}

# Print whether the server is running and if so give some information about memory usage and threads
server_status() {
	sudo -u "${MC_USER}" screen -S "${SESSION_NAME}" -Q select . > /dev/null
	if [ $? -eq 0 ]; then
		echo -e "Status:\e[39;1m running\e[0m"

		# Calculating memory usage
		for p in $(sudo -u "${MC_USER}" pgrep -f "${MAIN_JAR}"); do
			ps -p$p -O rss | tail -n1;
		done | gawk '{ count ++; sum += $2 }; END {count --; print "Number of processes =", count, "(screen, bash,", count-2, "x java)"; print "Total memory usage =", sum/1024, "MB" ;};'
	else
		echo -e "Status:\e[39;1m stopped\e[0m"
	fi
}

# Restart the complete server by shutting it down and starting it again
server_restart() {
	sudo -u "${MC_USER}" screen -S "${SESSION_NAME}" -Q select . > /dev/null
	if [ $? -eq 0 ]; then
		server_stop
		sleep 0.1
		server_start
	else
		server_start
	fi
}

# Backup the directories specified in $WORLDPATHS
backup_files() {
	# Check for the availability of the tar binaries
	which tar &> /dev/null
	if [ $? -ne 0 ]; then
		echo "The tar binaries are needed for a backup."
		exit 2
	fi

	echo "Starting backup..."
	FILE="$(date +%Y_%m_%d_%H.%M.%S).tar.gz"
	sudo -u "${MC_USER}" mkdir -p "${BACKUPPATH}"
	sudo -u "${MC_USER}" screen -S "${SESSION_NAME}" -Q select . > /dev/null
	if [ $? -eq 0 ]; then
		mc_command save-off
		mc_command save-all
		sync && wait
		sudo -u "${MC_USER}" tar -C "${SERVER_ROOT}" -czf "${BACKUPPATH}/${FILE}" --totals "${WORLDPATHS}" 2>&1 | grep -v "tar: Removing leading "
		mc_command save-on
	else
		sudo -u "${MC_USER}" tar -C "${SERVER_ROOT}" -czf "${BACKUPPATH}/${FILE}" --totals "${WORLDPATHS}" 2>&1 | grep -v "tar: Removing leading "
	fi
	echo -e "\e[39;1mbackup completed\e[0m\n"

	echo -n "Only keeping the last ${KEEP_BACKUPS} backups and removing the other ones..."
	BACKUP_COUNT=$(for f in "${BACKUPPATH}"/[0-9_.]*; do echo $f; done | wc -l)
	if [ $(expr ${BACKUP_COUNT} - ${KEEP_BACKUPS}) -gt 0 ]; then
		sudo -u "${MC_USER}" rm $(for f in "${BACKUPPATH}"/[0-9_.]*; do echo $f; done | head -n$(expr ${BACKUP_COUNT} - ${KEEP_BACKUPS}))
		echo -e "\e[39;1m done\e[0m ($(expr ${BACKUP_COUNT} - ${KEEP_BACKUPS}) backup(s) pruned)"
	else
		echo -e "\e[39;1m done\e[0m (no backups pruned)"
	fi
}

# Restore backup
backup_restore() {
	# Check for the availability of the tar binaries
	which tar &> /dev/null
	if [ $? -ne 0 ]; then
		echo "The tar binaries are needed for a backup."
		exit 2
	fi

	# Only allow the user to restore a backup if the server is down
	sudo -u "${MC_USER}" screen -S "${SESSION_NAME}" -Q select . > /dev/null
	if [ $? -eq 0 ]; then
		echo -e "The \e[39;1mserver should be down\e[0m in order to restore the world data."
		exit 3
	fi

	# Either let the user choose a backup or expect one as an argument
	if [ $# -lt 1 ]; then
		echo "Please enter the corresponding number for the backup to be restored: "
		i=1
		for f in "${BACKUPPATH}"/[0-9_.]*; do
			echo -e "    \e[39;1m$i)\e[0m\t$f"
			i=$((i+1))
		done
		echo -en "Restore backup number: "

		# Read in user input
		read USER_CHOICE

		# Interpeting the input
		if [[ $USER_CHOICE =~ ^-?[0-9]+$ ]]; then
			n=1
			for f in "${BACKUPPATH}"/[0-9_.]*; do
				[[ $n -eq $USER_CHOICE ]] && FILE="$f"
				n=$((n+1))
			done
			if [[ -z $FILE ]]; then
				echo -e "\e[39;1mFailed\e[0m to interpret your input. Please enter the digit of the presented options."
				exit 5
			fi
		else
			echo -e "\e[39;1mFailed\e[0m to interpret your input. Please enter a valid digit for one of the presented options."
			exit 6
		fi
	elif [[ $# -eq 1 ]]; then
		# Check for the existance of the specified file
		if [ -f "$1" ]; then
			FILE="$1"
		else
			if [ -f "${BACKUPPATH}"/"$1" ]; then
				FILE="${BACKUPPATH}"/"$1"
			else
				echo -e "Sorry, but '$1', is \e[39;1mnot a valid file\e[0m, neither in your current directory nor in the backup folder."
				exit 4
			fi
		fi
	elif [[ $# -gt 1 ]]; then
		echo -e "\e[39;1mToo many arguments.\e[0m Please pass only the filename for the world data as an argument."
		echo "Or alternatively no arguments at all to chose from a list of available backups."
		exit 1
	fi

	echo "Restoring backup..."
	sudo -u "${MC_USER}" tar -xf "${FILE}" -C "${SERVER_ROOT}" 2>&1
	if [[ $? -eq 0 ]]; then
		echo -e "\e[39;1mRestoration completed\e[0m"
	else
		echo -e "\e[39;1mFailed to restore backup.\e[0m"
	fi
}

# Run the given comman at the minecraft server console
server_command() {
	if [ $# -lt 1 ]; then
		echo "No server command specified. Try 'help' for a list of commands."
		exit 1
	fi

	sudo -u "${MC_USER}" screen -S "${SESSION_NAME}" -Q select . > /dev/null
	if [ $? -eq 0 ]; then
		sleep 0.1s &
		SLEEP_PID=$!
		mc_command "$@" &
		tail -f --pid=${SLEEP_PID} -n 0 "${LOGPATH}/latest.log"
	else
		echo "There is no ${SESSION_NAME} session to connect to."
	fi
}

# Enter the screen minecraft session
server_console() {
	sudo -u "${MC_USER}" screen -S "${SESSION_NAME}" -Q select . > /dev/null
	if [ $? -eq 0 ]; then
		sudo -u "${MC_USER}" screen -S "${SESSION_NAME}" -rx
	else
		echo "There is no ${SESSION_NAME} session to connect to."
	fi
}

# Help function, no arguments required
help() {
	cat <<- 'EOF'
	This script was design to easily control any minecraft server. Quite every parameter for a given
	minecraft server derivative can be altered by editing the variables in the configuration file.

	Usage: minecraftd {start|stop|status|backup|command <command>|console}
	    start                Start the minecraft server
	    stop                 Stop the minecraft server
	    restart              Restart the minecraft server
	    status               Print some status information
	    backup               Backup the world data
	    restore [filename]   Restore the world data from a backup
	    command <command>    Run the given comman at the minecraft server console
	    console              Enter the server console through a screen session

	Copyright (c) Gordian Edenhofer <gordian.edenhofer@gmail.com>
	EOF
}

case "$1" in
	start)
	server_start
	;;

	stop)
	server_stop
	;;

	status)
	server_status
	;;

	restart)
	server_restart
	;;

	console)
	server_console
	;;

	command)
	server_command "${@:2}"
	;;

	backup)
	backup_files
	;;

	restore)
	backup_restore "${@:2}"
	;;

	*|-h|--help)
	help
esac

exit 0
