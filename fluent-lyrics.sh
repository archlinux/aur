#!/bin/sh
export LD_LIBRARY_PATH=/usr/lib/fluent-lyrics/lib:$LD_LIBRARY_PATH
exec /usr/lib/fluent-lyrics/fluent_lyrics "$@"
