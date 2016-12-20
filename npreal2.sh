#!/bin/sh

case "$1" in
'start'|'restart')
  if [ ! -s '/etc/npreal2/rc.local' ]; then
    /usr/lib/npreal2/driver/mxloadsvr install
  else
    # The mx utilities sometimes put the lines in reverse order
    # We'll run the lines in the order we know is right
    sh -e -u -c "$(grep '^modprobe' '/etc/npreal2/rc.local')"
    sh -e -u -c "$(grep -F '/mxloadsvr' '/etc/npreal2/rc.local')" > /dev/null # turns out sh -c tolerates a blank command
  fi
  systemd-notify --ready
  exit 0
  ;;
'reload')
  killall -s USR1 'npreal2d'
  systemd-notify --ready
  exit 0
  ;;
'stop')
  # http://unix.stackexchange.com/questions/251195/difference-between-less-violent-kill-signal-hup-1-int-2-and-term-15
  # Though SIGINT < SIGTERM, npreal2d ignores SIGTERM so we try it first
  killall -s SIGTERM 'npreal2d' 'npreal2d_redund' # doesn't work
  killall -q -s SIGINT 'npreal2d' 'npreal2d_redund'
  killall -q -s SIGKILL 'npreal2d' 'npreal2d_redund'
  rmmod 'npreal2'
  systemd-notify --ready
  exit 0
  ;;
'status')
  systemd-notify --ready
  exit 0
  ;;
*)
  echo "Usage: $0 {start|stop|restart|reload|status}"
  exit 1
  ;;
esac
