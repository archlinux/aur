#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/vbox/vbox.cfg
. /etc/conf.d/vboxweb

BINARY="$INSTALL_DIR/vboxwebsrv"

start() {
  stat_busy "Starting VirtualBox Web Service";
  if ! pidof -o %PPID $BINARY >/dev/null; then
      [[ "$VBOXWEB_USER" ]] || stat_die
      lsmod | grep -q "vboxdrv[^_-]" || stat_die
      PARAMS="--background"
      [[ "$VBOXWEB_HOST" ]]           && PARAMS+=" -H $VBOXWEB_HOST"
      [[ "$VBOXWEB_PORT" ]]           && PARAMS+=" -p $VBOXWEB_PORT"
      [[ "$VBOXWEB_TIMEOUT" ]]        && PARAMS+=" -t $VBOXWEB_TIMEOUT"
      [[ "$VBOXWEB_CHECK_INTERVAL" ]] && PARAMS+=" -i $VBOXWEB_CHECK_INTERVAL"
      [[ "$VBOXWEB_THREADS" ]]        && PARAMS+=" -T $VBOXWEB_THREADS"
      [[ "$VBOXWEB_KEEPALIVE" ]]      && PARAMS+=" -k $VBOXWEB_KEEPALIVE"
      [[ "$VBOXWEB_LOGFILE" ]]        && PARAMS+=" -F $VBOXWEB_LOGFILE"
      # prevent inheriting this setting to VBoxSVC
      unset VBOX_RELEASE_LOG_DEST
      su - $VBOXWEB_USER -c "$BINARY $PARAMS" &>/dev/null
      # ugly: wait until the final process has forked
      sleep .2
      if pidof -o %PPID $BINARY >/dev/null; then
          add_daemon vboxweb
          stat_done
      else
          stat_die
      fi
  else
    stat_die
  fi
}

stop() {
  stat_busy "Stopping VirtualBox Web Service"
  PID=$(pidof -o %PPID $BINARY)
  [[ $PID ]] && kill $PID &>/dev/null
  if ! pidof -o %PPID $BINARY >/dev/null; then
    rm_daemon vboxweb
    stat_done
  else
    stat_die
  fi
}

restart() {
  stop && start
}

status() {
  stat_busy "Checking for VirtualBox Web Service"
  if pidof -o %PPID $BINARY >/dev/null; then
      stat_done
  else
      stat_fail
      false
  fi
}

case "$1" in
start)
    start
    ;;
stop)
    stop
    ;;
restart)
    restart
    ;;
force-reload)
    restart
    ;;
status)
    status
    ;;
*)
    echo "Usage: $0 {start|stop|restart|status}"
    exit 1
esac

# vim:set ts=2 sw=2 ft=sh et:
