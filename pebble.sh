#!/bin/sh

export PATH=/opt/pebble/pebble-tool/pebble_tool/commands/sdk:$PATH
python2 /opt/pebble/pebble-tool/pebble.py "$@"
