#!/bin/sh
export LD_LIBRARY_PATH="/opt/algodoo/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
exec /opt/algodoo/algodoo.bin "$@"
