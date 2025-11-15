#!/usr/bin/bash

set -e
mkdir -p ~/.local/share/rvx-builder
cd ~/.local/share/rvx-builder

start="node /usr/lib/node_modules/rvx-builder/index.js"

if command -v electron; then
  $start --no-open &
  pid=$!
  sleep 1
  electron http://localhost:8000/ 
  if ps -p $pid > /dev/null
  then
     kill $pid
  fi
else
  $start
fi
