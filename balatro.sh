#!/bin/sh

if test -f /usr/lib/liblovely.so; then
  export LD_PRELOAD="/usr/lib/liblovely.so"
fi

exec love /usr/share/balatro/balatro.love
