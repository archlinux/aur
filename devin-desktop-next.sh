#!/bin/bash
set -euo pipefail

# Launcher for devin-desktop-next using the system Electron runtime.
# The actual application resources live under /opt/devin-desktop-next/resources/app.

ELECTRON_RUN_AS_NODE=1 exec /usr/lib/@@ELECTRON@@/electron /opt/devin-desktop-next/resources/app/out/cli.js "$@"
