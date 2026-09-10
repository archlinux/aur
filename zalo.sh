#!/bin/sh
export ELECTRON_FORCE_IS_PACKAGED=1
exec /usr/bin/electron22 /usr/lib/zalo "$@"
