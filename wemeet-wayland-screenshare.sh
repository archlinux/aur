#!/bin/bash

export LD_PRELOAD="/usr/lib/wemeet/libhook.so"
exec /usr/bin/wemeet-x11 "$@"