#!/bin/bash

set -e

[[ $# -ge 2 ]] || {
	echo 'usage: usocks host command'
	exit
}

port=$((32768+$RANDOM))
ssh -fNT -D ${port} $1
shift

export USOCKS_PORT=${port}
export USOCKS_ADDR=127.0.0.1
export LD_PRELOAD=/usr/lib/usocks.so
exec "$@"
