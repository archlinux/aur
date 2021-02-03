#!/bin/sh
cd /usr/share/lua-language-server

TMPPATH=$(mktemp -d "/tmp/lua-language-server.XXXX")
DEFAULT_LOGPATH="$TMPPATH/log"
DEFAULT_METAPATH="$TMPPATH/meta"

exec /usr/lib/lua-language-server/lua-language-server -E ./main.lua \
  --logpath="$DEFAULT_LOGPATH" --metapath="$DEFAULT_METAPATH" \
  "$@"
