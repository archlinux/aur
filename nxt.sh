#!/bin/sh

if [ active == $(systemctl is-active nxt) ]; then
	exec xdg-open http://localhost:7876/
fi

MSG="Service isn't active. Try starting NXT with 'systemctl start nxt'"

if hash notify-send &>/dev/null; then
	exec notify-send -u critical "NXT" "$MSG"
else
	echo "NXT" "$MSG"
fi
