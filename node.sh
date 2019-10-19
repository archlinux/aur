#!/bin/sh

export ELECTRON_RUN_AS_NODE=1
export ELECTRON_NO_ASAR=1

exec /usr/lib/electron2/electron "$@"
