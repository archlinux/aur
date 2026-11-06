#!/bin/sh
# The CLI is statically linked and only needs the bundled libccid.
export LD_LIBRARY_PATH="/usr/lib/ishield-key-manager${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
exec /opt/ishield-key-manager/cli/iKMcli "$@"
