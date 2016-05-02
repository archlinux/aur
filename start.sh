#!/bin/bash

EXEC="/usr/local/bin/messengerfordesktop"

exec -a "$0" "$EXEC" $params &
pid=$!

while [ -z $winid ]
do
	winid=$(xwininfo -name "Messenger" 2> /dev/null | grep "Window id:" | grep -Eio "0x[a-z0-9]+")
done
xprop -id ${winid} -f WM_CLASS 8s -set WM_CLASS "MessengerForDesktop"

wait $pid
