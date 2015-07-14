#!/bin/bash

CONFDIR='/etc/conf.d/tshock'

if [ -n "$2" ]; then
	INSTANCE=$2
else
	INSTANCE=default
fi

if [ -r ${CONFDIR}/${INSTANCE}.conf ]; then
	source ${CONFDIR}/${INSTANCE}.conf
else
	echo "TShock could not be started because ${CONFDIR}/${INSTANCE}.conf could not be read."
	exit 1
fi

TMUX_CONSOLE=tshock-console-${INSTANCE}

case "$1" in
	start)
		if [ ! $(tmux has -t ${TMUX_CONSOLE}) ]; then
			tmux new-session -d -s ${TMUX_CONSOLE} -d "cd ${BASEDIR}; mono TerrariaServer.exe -port ${PORT} -world My\ Games/Terraria/Worlds/${WORLD}.wld"
			if [ $? -gt 0 ]; then
				exit 1
			fi
		else
			echo "Tshock already running"
			exit 1
		fi
		;;

	stop)
		tmux send-keys -t ${TMUX_CONSOLE} 'broadcast NOTICE: Server shutting down in 5 seconds!' C-m
		sleep 5
		tmux send-keys -t ${TMUX_CONSOLE} 'exit' C-m
		sleep 10
		;;

	console)
		tmux attach -t ${TMUX_CONSOLE}
		;;

	install)
		bash -c "cd ${BASEDIR}; mono TerrariaServer.exe"
		;;

	*)
		echo "usage: $0 {start|backup|console|install} [instance]"
esac

exit 0
