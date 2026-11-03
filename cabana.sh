#!/bin/sh
# Cabana calls python3 at runtime for remote routes, login, log migration and the
# WebRTC device bridge, so it needs the bundled interpreter and openpilot modules.
root=/opt/openpilot-cabana
export PATH="$root/.venv/bin:$PATH"
export PYTHONPATH="$root:$root/msgq_repo:$root/opendbc_repo:$root/rednose_repo:$root/teleoprtc_repo"
export PYTHONDONTWRITEBYTECODE=1
exec "$root/openpilot/tools/cabana/cabana" "$@"
