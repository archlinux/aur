#!/bin/bash

daemon_name=vboxtool

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/$daemon_name.conf

start()
{
  # 'vboxtoolinit start' maps to 'vboxtool autostart'; when the host boots, all sessions in 
  # the config file /etc/vboxtool/machines.conf are started
  $su_command "vboxtool autostart" > /dev/null
}

stop()
{
  # 'vboxtoolinit stop' maps to 'vboxtool save'; when the host halts, all running sessions 
  # are saved, instead of stopped.
  $su_command "vboxtool save" > /dev/null
}

if [ -f "$config_file" ]
then
  . "$config_file"
else
  echo "Error: $config_file does not exist. Exiting."
  exit 1
fi

if [ ! -n "$vbox_user" ]
then
  echo "Error: vbox_user not defined in $config_file. Exiting."
  exit 1  
fi

# Implementation of user control, execute several commands as another (predefined) user, 
# thus freeing the main script vboxtool from any user related issues.
su_command="su - $vbox_user -c"

case "$1" in
  start)
    stat_busy "Starting $daemon_name"
    start
    add_daemon $daemon_name
    stat_done
    ;;

  stop)
    stat_busy "Stopping $daemon_name"
    stop
    rm_daemon $daemon_name
    stat_done
    ;;

  restart)
    $0 stop
    sleep 3
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
exit 0
