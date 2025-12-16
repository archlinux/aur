#!/bin/sh

export PATH="@@ZIG_PATH@@:$PATH"

exec @@ZLS_PATH@@/zls "$@"
