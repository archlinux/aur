#!/bin/sh
export LD_PRELOAD=libcurl.so.3:/usr/lib/spotifywm.so
/usr/share/spotify/spotify "$@"
