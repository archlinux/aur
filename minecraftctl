#!/bin/bash


# Adapted from generic minecraft init script
#	 http://www.minecraftwiki.net/wiki/Tutorials/Server_startup_script
#
# Main Differences: 
#   - Start stop and reload is handled by systemd, removed
#   - update handled by pacman, removed
#   - changed from init script to "minecraftctl" command.
#   - uses /etc/conf.d/minecraftd for variables
#
# Changes:
#
#   Changed running screen to work as root, broke it out into mc_docommand
#   Commented echo commands for successful execution to not spam the log.


. /etc/conf.d/minecraft || echo "can't source /etc/conf.d/minecraft"


ME=`whoami`
as_user() {
  if [ $ME == $MCUSER ] ; then
    bash -c "$1"
  else
    su - $MCUSER -c "$1"
  fi
}

mc_saveoff() {
  if pgrep -u $MCUSER -f $SERVICE > /dev/null
  then
    #echo "$SERVICE is running... suspending saves"
	mc_docommand "say $BACKUPSTARTMSG"
	mc_docommand save-off
	mc_docommand save-all
    sync
    sleep 10
  else
    echo "$SERVICE is not running. Not suspending saves."
  fi
}

mc_saveon() {
  if pgrep -u $MCUSER -f $SERVICE > /dev/null
  then
    #echo "$SERVICE is running... re-enabling saves"
	mc_docommand save-on
	mc_docommand "say $BACKUPENDMSG"
  else
    echo "$SERVICE is not running. Not resuming saves."
  fi
}

mc_backup() {
   mc_saveoff
   
   NOW=`date "+%Y-%m-%d_%Hh%M"`
   BACKUP_FILE="$BACKUPPATH/${WORLD}_${NOW}.tar"
   #echo "Backing up minecraft world..."
   #as_user "cd $_SRVDIR && cp -r $WORLD $BACKUPPATH/${WORLD}_`date "+%Y.%m.%d_%H.%M"`"
   as_user "tar -h -C \"$_SRVDIR\" -cf \"$BACKUP_FILE\" \"$WORLD\""

   #echo "Backing up $SERVICE"
   as_user "tar -h -C \"$_SRVDIR\" -rf \"$BACKUP_FILE\" \"$SERVICE\""
   #as_user "cp \"$_SRVDIR/$SERVICE\" \"$BACKUPPATH/minecraft_server_${NOW}.jar\""

   mc_saveon

   #echo "Compressing backup..."
   as_user "gzip -f \"$BACKUP_FILE\""
   #echo "Done."
}

mc_command() {
  command="$1";
  if pgrep -u $MCUSER -f $SERVICE > /dev/null
  then
    pre_log_len=`wc -l "$_SRVDIR/server.log" | awk '{print $1}'`
    #echo "$SERVICE is running... executing command"
	mc_docommand "$command"
    sleep .1 # assumes that the command will run and print to the log file in less than .1 seconds
    # print output
    tail -n $[`wc -l "$_SRVDIR/server.log" | awk '{print $1}'`-$pre_log_len] "$_SRVDIR/server.log"
  else
    echo "$SERVICE is not running. Couldn't executed command."
  fi
}

mc_docommand() {
	screen -p 0 -S minecraft -X stuff "`printf \"$1\r\"`"
}


#Start-Stop here
case "$1" in
  backup)
    mc_backup
    ;;
  status)
    if pgrep -u $MCUSER -f $SERVICE > /dev/null
    then
      echo "$SERVICE is running."
    else
      echo "$SERVICE is not running."
    fi
    ;;
  command)
    if [ $# -gt 1 ]; then
      shift
      mc_command "$*"
    else
      echo "Must specify server command (try 'help'?)"
    fi
    ;;

  *)
    echo "Usage: $0 {backup|status|command \"server command\"}"
    exit 1
  ;;
esac

exit 0
