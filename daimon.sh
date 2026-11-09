#!/bin/sh
# Offline stand-in for the Windows-only bin/daimon entry point. The kernel JS
# lives in the daimon bundle and is run by the runtime/node wrapper installed
# alongside it.
set -eu
DIR=$(cd "$(dirname "$0")" && pwd)
exec "${DIR}/../runtime/node" "${DIR}/../app/daimon/dist/src/runner/cli.js" "$@"
