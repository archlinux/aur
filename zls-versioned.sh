#!/bin/sh

export PATH="@@ZIG_PATH@@:$PATH"

exec /usr/lib/zls@@ZIG_VERSION@@/zls@@ZIG_VERSION@@ "$@"
