#!/bin/sh

. /usr/share/remoteit/functions.sh

if [ "$1" = "boot" ]; then
  until r3_update_config; do
    if [ -n "$(r3_get_device_id)" ]; then
      break
    fi
    sleep 5
  done
  r3_start_services 2>/dev/null
else
  r3_reload_agent
fi