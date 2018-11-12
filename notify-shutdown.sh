#!/bin/bash

. "$RUNTIME_DIR/vars"

if [ "$rcon" = true ]; then
  grace=10
  /usr/bin/mcrcon -H localhost -P "$port" -p "$password" \
      "say NOTICE: Server shutting down in $grace seconds" > /dev/null
  sleep "$((grace - 5))"
  /usr/bin/mcrcon -H localhost -P "$port" -p "$password" \
      "say NOTICE: Server shutting down in 5 seconds" > /dev/null
  sleep 5
fi

# The rest of this script would normally be handled by systemd, except that we
# specify an ExecStop in order to notify users of the impending shutdown. We
# can also go ahead and use the cleaner stop command.

PID="$(cat "$RUNTIME_DIR/pid")"
# We also double-check that mcrcon is still installed, because it could have
# been uninstalled since vars was generated and it is very important that we do
# a graceful shutdown
if [ "$rcon" = true -a -x /usr/bin/mcrcon ]; then
  # Prefer stop command over kill, because kill triggers java.util.logging's
  # shutdown hook which prevents some final log statements from being written.
  /usr/bin/mcrcon -H localhost -P "$port" -p "$password" stop > /dev/null
else
  kill "$PID"
fi

# Wait for server shutdown
for (( X=0; X<60; X++ )); do
  ps -p "$PID" > /dev/null || break
  sleep .5
done
