#!/bin/sh
# Having this variable set can make transition segfault
unset SESSION_MANAGER

# If default openssl is 1.1.1, the updater will crash
LD_RUN_PATH=/usr/lib/openssl-1.0 /opt/ankama/transition/transition "$@"
