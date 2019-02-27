#!/bin/sh
export LD_PRELOAD=/usr/lib/spotifywm.so
/usr/bin/spotify "$@"
