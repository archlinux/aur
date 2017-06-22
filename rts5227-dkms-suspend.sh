#!/bin/bash
# unload rts5227 before suspend, reload afterwards

case $1 in
  pre)
    rmmod rts5227
  ;;
  post)
    modprobe rts5227
  ;;
esac
