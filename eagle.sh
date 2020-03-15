#!/bin/sh

# eagle requires its own supplied shared libraries. For users having
# set LD_LIBRARY_PATH, we need to extend it by /opt/eagle/lib.
if [ -n $LD_LIBRARY_PATH ]; then
	export LD_LIBRARY_PATH=/opt/eagle/lib:$LD_LIBRARY_PATH
fi

/opt/eagle/eagle "$@"
