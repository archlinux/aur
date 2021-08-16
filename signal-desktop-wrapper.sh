#!/bin/sh
export SQLCIPHER_LIB="/usr/lib/signal-desktop-beta/resources/app.asar.unpacked/node_modules/better-sqlite3/build/Release/better_sqlite3.node"
export LD_PRELOAD="$SQLCIPHER_LIB"
exec /usr/lib/signal-desktop-beta/signal-desktop-beta "$@"
