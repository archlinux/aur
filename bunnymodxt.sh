#!/bin/bash

set -eu

cd "$(dirname "$0")"

export LD_PRELOAD=/usr/lib/libBunnymodXT.so:${LD_PRELOAD-}
export LD_LIBRARY_PATH=$PWD:${LD_LIBRARY_PATH-}

ulimit -n 2048

exec ./hl_linux "$@"
