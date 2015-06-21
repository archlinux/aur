#!/bin/sh
# Having this variable set can make transition segfault
unset SESSION_MANAGER

/opt/ankama/transition/transition "$@"
