#!/bin/sh
map=`(echo -e "tut1\nrun1\nrun2" && ls ~/.purity/base/maps/ 2>/dev/null | grep "\.bsp" | egrep -o '.+[^\.bsp]') | zenity --list --text="Choose the map you wanna launch" --column="Map"`

case $map in
"")
	;;
tut1)
	purity_cmd -nointro +sv_pure 0 +g_gametype 5 +map $map
	;;
*)
	purity_cmd -nointro +sv_pure 0 +g_gametype 3 +map $map
	;;
esac
