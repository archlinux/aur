#!/usr/bin/bash
export LD_LIBRARY_PATH=.
pwd=/opt/lsi/LSIStorageAuthority

start() {
  cd "${pwd}/bin"
  if pgrep -x "LSA" > /dev/null; then
    killall -15 LSA
  fi
  ./LSA start
}

stop() {
  cd "${pwd}/bin"
  ./slp_deregister
  if pgrep -x "LSA" > /dev/null; then
    killall -15 LSA
  fi
}

server_start() {
  cd "${pwd}/server"
  ./nginx -p .
}

stop_start() {
  cd "${pwd}/server"
  ./nginx -s stop -p .
}

reload() {
  stop
  server_stop
  sleep 2
  start
  server_start
}

$1
