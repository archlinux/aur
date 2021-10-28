#!/bin/sh
# This wrapper makes voxygen behave as if it was compiled with `VELOREN_USERDATA_STRATEGY=SYSTEM`

not_found_error="Couldn't find a path for user data. Try setting VELOREN_USERDATA or XDG_DATA_HOME."
[ $XDG_DATA_HOME ] && xdg_path=$XDG_DATA_HOME/veloren/userdata
export VELOREN_USERDATA=${VELOREN_USERDATA-"${xdg_path-${HOME?$not_found_error}/.local/share/veloren/userdata}"}

/usr/lib/veloren/voxygen "$@"
