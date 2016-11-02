#!/bin/sh
export LD_LIBRARY_PATH="/usr/lib/scenarist:$LD_LIBRARY_PATH"
exec /usr/lib/scenarist/scenarist "$@"
