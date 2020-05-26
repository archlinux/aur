#!/bin/bash

[ $EUID = 0 ] && echo "Do not run this script as root." && exit 1

ibus_engine() {
	if pgrep -x ibus-daemon > /dev/null; then
		engine="$(ibus engine)"
		case $engine in
			"Bamboo") icon="V" ;;
			"xkb:us::eng") icon="E" ;;
			*) ;;
		esac
	fi
	echo "$icon"
}

ibus_engine


exit 0
