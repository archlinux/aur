#!/bin/bash
set -euo pipefail

export ELECTRON_IS_DEV=0
export ELECTRON_FORCE_IS_PACKAGED=true
export ELECTRON_DISABLE_SECURITY_WARNINGS=true
export NODE_ENV=production

exec /usr/bin/electron43 /usr/lib/stably-orca/app.asar "$@"
