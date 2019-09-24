#!/bin/sh
export PATH=/usr/lib/jvm/default-runtime/bin/:"$PATH"
exec /usr/share/arduino/arduino "$@"
