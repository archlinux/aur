#!/bin/sh
set -e

# enforce usage of system wide readline
LD_PRELOAD=/usr/lib/libreadline.so exec /usr/share/odrive/odriveagent "$@"
