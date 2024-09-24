#!/usr/bin/env bash

runDir="/run";
pidFile="${runDir}/alisased.pid";

start() {
	if [ ! -d "${runDir}" ]; then
		mkdir -p /var/run;
	fi
	
	pid=$(pgrep -f alisasesvc);
	if [ -z "${pid}" ]; then
		/usr/local/bin/alisase-bin/3.4.2/alisasesvc --daemon
		pid=$(pgrep -f alisasesvc);
		echo "Start alisasesvc with pid ${pid} ."
	else
		echo "alisasesvc running with ${pid} ."
	fi

	echo "${pid}" > "${pidFile}";
}

stop() {
	if [ -f "${pidFile}" ] && [ -s "${pidFile}" ]; then
		pid=$(cat "${pidFile}");
	else
		pid=$(pgrep -f alisasesvc);
	fi

	if [ -n "${pid}" ] && ps -p "${pid}" > /dev/null; then
		echo "Stop alisasesvc with pid : ${pid} ...";
		kill -9 "${pid}";
	else
		echo "alisasesvc Stopped ${pid} !" 
	fi

	if [ -f "${pidFile}" ]; then
		rm "${pidFile}";
	fi
}

stopPost(){
	sleep 1;
	echo "Clean runnig Symbols .";
}

restart(){
	stop
	start
}

case "$1" in 
	"start")
		start;
	;;
	"stop")
		stop;
	;;
	"restart")
		restart;
	;;
	"stopPost")
		stopPost;
	;;
	*)
		echo "Invalid options .";
		exit 1
	;;
esac