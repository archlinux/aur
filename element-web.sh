#!/bin/bash

pacman -Qq darkhttpd >/dev/null || { echo "Install darkhttpd to use this feature." && exit 1; }

readonly addr=127.0.0.1 port=8000

serve() {
	darkhttpd /usr/share/webapps/element --port "$port" --addr "$addr" --log /dev/null --daemon
}

stop() {
	pkill --signal SIGINT -f 'webapps/element'
}

if [[ $1 == serve ]]; then
	serve && xdg-open "http://$addr:$port/"
elif [[ $1 == stop ]]; then
	stop
elif [[ $1 == restart ]]; then
	stop
	serve
else
	echo "USAGE: $(basename -- "$0") serve|stop|restart"
fi
