#!/bin/sh
export DENO_DIR=/usr/lib/kosmozoo/deno-dir DENO_NO_UPDATE_CHECK=1
export DENO_SQLITE_PATH="${DENO_SQLITE_PATH:-/usr/lib/libsqlite3.so}"
export KOZMOZOO_REVISION=@KOZMOZOO_REVISION@
exec /usr/bin/deno run --frozen --cached-only --allow-all \
  --config=/usr/lib/kosmozoo/deno.json /usr/lib/kosmozoo/src/cli.mjs "$@"
