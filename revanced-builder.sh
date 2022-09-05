#!/usr/bin/bash

set -e

start="node /opt/revanced-builder/index.js"

if command -v electron; then
  $start --no-open &
  pid=$!
  electron http://localhost:8000/ && kill $pid
else
  $start
fi
