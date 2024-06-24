#!/usr/bin/bash

set -e
mkdir -p ~/.local/share/rvx-builder
cd ~/.local/share/rvx-builder

start="node /opt/rvx-builder/index.js"

if command -v electron; then
  $start --no-open &
  pid=$!
  sleep 1
  electron http://localhost:8000/ && kill $pid
else
  $start
fi
