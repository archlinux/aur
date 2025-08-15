#!/bin/bash
export LD_LIBRARY_PATH="/usr/lib/openbubbles/lib:$LD_LIBRARY_PATH"
cd /usr/lib/openbubbles
exec /usr/lib/openbubbles/bluebubbles "$@"
