#!/bin/bash
case $1/$2 in
  post/*)
    /usr/local/sbin/k290_fnkeyctl
    ;;
esac

