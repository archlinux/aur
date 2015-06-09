#!/bin/bash

 . /etc/rc.conf
 . /etc/rc.d/functions

# source application-specific settings
[ -f /etc/conf.d/djmount ] && . /etc/conf.d/djmount

 case "$1" in

   start)
     stat_busy "Starting djmount"
     /usr/bin/djmount $OPTIONS $MOUNTPOINT &>/dev/null
     if [ $? -ne 0 ]; then
       stat_fail
     else
       add_daemon djmount
       stat_done
     fi
   ;;

   stop)
     stat_busy "Stopping djmount"
     fusermount -u $MOUNTPOINT
     kill -9 `pidof /usr/bin/djmount` &>/dev/null
     rm_daemon djmount
     stat_done
   ;;

   restart)
     stat_busy "Restarting djmount ..."
     $0 stop
     $0 start
     stat_done
   ;;

   *)
     echo "usage: $0 {start|stop|restart}"
 esac
