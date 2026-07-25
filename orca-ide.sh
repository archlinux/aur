#!/bin/bash
set -euo pipefail

export ORCA_NODE_OPTIONS="${NODE_OPTIONS-}"
export ORCA_NODE_REPL_EXTERNAL_MODULE="${NODE_REPL_EXTERNAL_MODULE-}"
unset NODE_OPTIONS
unset NODE_REPL_EXTERNAL_MODULE

ELECTRON_RUN_AS_NODE=1 exec /usr/lib/electron43/electron \
  /usr/lib/stably-orca/app.asar.unpacked/out/cli/index.js "$@"
