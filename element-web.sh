#!/bin/bash

pacman -Qq darkhttpd >/dev/null || { echo "Install darkhttpd to use this feature." && exit 1; }

readonly addr=127.0.0.1 port=8000

serve() {
	darkhttpd /usr/share/webapps/element --port "$port" --addr "$addr" --daemon --log /dev/null
}

stop() {
	pkill --signal SIGINT -f 'webapps/element'
}

restart() {
	stop
	serve
}

status() {
	if pgrep -f 'webapps/element'; then
		echo "Running."
	else
		echo "Stopped."
	fi
}

if declare -f -- "$1" >/dev/null; then
	"$@"
else
	echo "This script serves element-web at http://$addr:$port/"
	echo "USAGE: $(basename -- "$0") serve|stop|restart|status"
fi
