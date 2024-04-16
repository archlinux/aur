#!/bin/bash

source /etc/conf.d/penpot

update_flags() {
  if [ -n "$PENPOT_FRONTEND_FLAGS" ]; then
    echo "var penpotFlags = \"$PENPOT_FRONTEND_FLAGS\";" > $1
  fi
}

update_flags /usr/share/webapps/penpot/js/config.js
