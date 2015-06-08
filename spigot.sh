#!/bin/bash

BACKUPPATH="/srv/craftbukkit/backup/"
WORLDPATH="/srv/craftbukkit/world/"

USER="$2"

if [ -z $2 ]; then
        USER="craftbukkit"
fi

save_stop() {
    su -s /bin/bash -c "tmux send-keys 'save-off' C-m" ${USER}
    su -s /bin/bash -c "tmux send-keys 'save-all' C-m" ${USER}
}

save_start() {
    su -s /bin/bash -c "tmux send-keys 'save-on' C-m" ${USER}
}

case "$1" in
  start)
    if [ -z "`pgrep -f -n 'spigot.jar'`" ]; then
      sudo -u ${USER} tmux new-session -d -s spigot-console -d 'cd /srv/craftbukkit; java -Xmx1024M -Xms1024M -jar /srv/craftbukkit/spigot.jar nogui'
      if [ $? -gt 0 ]; then
        exit 1
      fi
    else
      echo "Spigot already started"
      exit 1
    fi
    ;;

  stop)
    sudo -u ${USER} tmux send-keys -t spigot-console 'broadcast NOTICE: Server shutting down in 5 seconds!' C-m
    sleep 5
    sudo -u ${USER} tmux send-keys -t spigot-console 'stop' C-m
    sleep 10
    ;;

  console)
    sudo -u ${USER} tmux attach -t spigot-console
    ;;
  
  backup)
    stat_busy "Starting backup"
    FILE="`date +%Y%m%d%H%M`.tar.gz"
    path="$BACKUPPATH/$FILE"
    su -s /bin/bash -c "mkdir -p $BACKUPPATH" ${USER}
    save_stop
    su -s /bin/bash -c "tar -czf $path $WORLDPATH" ${USER}
    save_start
    stat_done "Backup finished"
    ;;

  *)
    echo "usage: $0 {start|backup|console} user"
esac

exit 0

