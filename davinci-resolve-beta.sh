#!/usr/bin/sh

INSTALL_DIR="/opt/resolve"
export LD_PRELOAD="/usr/lib/libc++.so.1:/usr/lib/libc++abi.so.1${LD_PRELOAD:+:$LD_PRELOAD}"
exec "$INSTALL_DIR/bin/resolve" "$@"
