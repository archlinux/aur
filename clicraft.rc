#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

MINECRAFT_USER="minecraft"

case "$1" in
  start)
	stat_busy 'Starting Minecraft Server'
	su $MINECRAFT_USER -c "/usr/bin/clicraft start" &> /dev/null
	if [[ $? -gt 0 ]]; then
		stat_fail
	else
		add_daemon minecraft
		stat_done
	fi
  ;;
  stop)
	stat_busy 'Stopping Minecraft Server'
	su $MINECRAFT_USER -c "/usr/bin/clicraft stop" &> /dev/null
	if [[ $? -gt 0 ]]; then
		stat_fail
	else
		rm_daemon minecraft
		stat_done
	fi
  ;;
  restart)
	$0 stop
	sleep 1
	$0 start
  ;;
  *)
	echo "usage: $0 {start|stop|restart}"
  ;;
esac
exit 0

# vim: set ft=sh:
