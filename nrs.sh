#!/bin/bash

nxt_status=$(systemctl is-active nxt)

which notify-send > /dev/null
is_libnotify_installed=$?

if [ $libnotify_installed ]; then
  echo "libnotify_installed"
fi

if [ $nxt_status != "active" ]; then
  start_nxt_message="NXT service isn't active. Try starting NXT with 'systemctl start nxt' if NRS doesn't load."
  if [ $is_libnotify_installed ]; then
    notify-send "NRS" "$start_nxt_message"
  fi
  echo "$start_nxt_message"
fi

xdg-open http://localhost:7876/
