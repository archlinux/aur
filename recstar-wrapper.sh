#!/bin/sh
export LD_PRELOAD=/usr/lib/libfreetype.so
BINARY_PATH="/opt/recstar/bin/RecStar"
exec "$BINARY_PATH" "$@"