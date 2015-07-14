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

## The following parameters can be added to TShock to alter the way a server initializes.
## Options set via the command line will override all configuration options regardless.
## These can be used either for personal use or in a GSP environment for easier hosting without hassle:
## Terraria Server API Command Line:
##   -ip <ipv4>          - Starts the server bound to a given IPv4 address
##   -port <port>        - Starts the server bound to a given port
##   -maxplayers <count> - Starts the server with a given player count
##   -world <file.wld>   - Starts the server and immediately loads a given
##                         world file
##   -worldpath <path>   - Starts the server and changes the world path to a
##                         given path
##   -autocreate <1/2/3> - Starts the server and, if a world file isn't found,
##                         automatically create the world file with a given
##                         size, 1-3, 1 being small.
##   -config <file>      - Starts the server with a given config file
##   -connperip <n>      - Allows n number of connections per IP.
##   -killinactivesocket - Kills connections which have not started the
##                         protocol handshake.
##   -lang <type>        - Sets the server's language.
##   -ignoreversion      - Ignores API version checks for plugins allowing for
##                         old plugins to run.
##   -forceupdate        - Forces the server to continue running, and not
##                         hibernating when no players are on. This results in
##                         time passing, grass growing, and cpu running.
## TShock Command Line:
##   -configpath <path>     - The path tshock uses to resolve configs, log
##                            files, and sqlite db.
##   -worldpath <path>      - The path that Terraria Server uses to find all
##                            world files.
##   -logpath <path>        - Overrides the default log path and saves logs
##                            here.
##   -logformat <format>    - Format the name of log files, subject to C# date
##                            standard abbreviations,
##   -logclear <true/false> - Overwrites old config if it exists.
##   -dump                  - Dumps permissions and config file descriptions for
##                            wiki use.

case "$1" in
	start)
		if [ ! $(tmux has -t ${TMUX_CONSOLE}) ]; then
			tmux new-session -d -s ${TMUX_CONSOLE} -d "cd ${BASEDIR}; mono TerrariaServer.exe -port ${PORT} -worldpath ${WORLDDIR} -world ${WORLDDIR}/${WORLD}.wld -autocreate ${SIZE}"
			if [ $? -gt 0 ]; then
				exit 1
			fi
		else
			echo "This TShock instance is already running"
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
