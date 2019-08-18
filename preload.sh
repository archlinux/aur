#!/bin/bash

[[ $LD_PRELOAD ]] && LD_PRELOAD+=" "
export LD_PRELOAD+="/usr/lib/libhardened_malloc.so"
exec "$@"
