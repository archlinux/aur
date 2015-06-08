#!/bin/bash

# temp files should be places on the ramdisk, feel free to change their paths
_tempamdpcsdb=/dev/shm/amdpcsdb.current
_tempatiapfxx=/dev/shm/atiapfxx.blb.current

start_links(){
if [ ! -e /etc/ati/amdpcsdb.current ]; then
  if [ -e /etc/ati/amdpcsdb ]; then
    cp /etc/ati/amdpcsdb /etc/ati/amdpcsdb.current
  else
    cp /etc/ati/amdpcsdb.default /etc/ati/amdpcsdb.current
  fi
fi

if [ ! -e /etc/ati/atiapfxx.blb.current ]; then
   cp /etc/ati/atiapfxx.blb /etc/ati/atiapfxx.blb.current
fi

cp /etc/ati/amdpcsdb.current ${_tempamdpcsdb}
cp /etc/ati/atiapfxx.blb.current ${_tempatiapfxx}
ln -sf ${_tempamdpcsdb} /etc/ati/amdpcsdb
ln -sf ${_tempatiapfxx} /etc/ati/atiapfxx.blb
}

stop_links(){
cp ${_tempamdpcsdb} /etc/ati/amdpcsdb.current
cp ${_tempatiapfxx} /etc/ati/atiapfxx.blb.current
}

case "$1" in
    start)
	start_links
	;;
    stop)
	stop_links
	;;
esac