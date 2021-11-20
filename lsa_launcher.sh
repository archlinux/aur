#!/usr/bin/bash
export MALLOC_CHECK_=0
pwd=/opt/lsi/LSIStorageAuthority

start() {
  cd "${pwd}/bin"
  if pgrep -x "LSA" > /dev/null; then
    killall -9 LSA
  fi
  ./LSA -start
}

stop() {
  cd "${pwd}/bin"
  ./slp_deregister
  if pgrep -x "LSA" > /dev/null; then
    killall -9 LSA
  fi
}

server_start() {
  cd "${pwd}/server"
  ./nginx -p .
}

server_stop() {
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
