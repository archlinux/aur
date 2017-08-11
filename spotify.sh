#!/bin/sh
export LD_PRELOAD=libcurl.so.3:/usr/share/spotify/spotifywm.so
/usr/share/spotify/spotify "$@"
