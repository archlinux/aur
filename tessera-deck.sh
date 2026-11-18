#!/usr/bin/bash
# Tessera launcher for the Arch package.
# The host keeps its profiles, logs and locks next to its own code, so the read-only copy in
# /usr/share/tessera is synced into a per-user writable tree, which is then run with the system Python packages.
set -eu
SRC=/usr/share/tessera
DATA="${XDG_DATA_HOME:-$HOME/.local/share}/tessera"

if [ ! -x "$DATA/host/.venv/bin/python" ] || ! cmp -s "$SRC/VERSION" "$DATA/VERSION" \
   || [ "$(cat "$SRC/.pkgrel" 2>/dev/null)" != "$(cat "$DATA/.pkgrel" 2>/dev/null)" ]; then
  mkdir -p "$DATA"
  # Overwrites shipped files only; user data (profiles.json, *.local.*, icons, plugins you added) is left alone.
  cp -rfT --no-preserve=mode,ownership "$SRC" "$DATA"
  chmod -R u+rwX "$DATA"
  rm -rf "$DATA/host/.venv"
  python -m venv --system-site-packages "$DATA/host/.venv"
fi

cd "$DATA"
PY="$DATA/host/.venv/bin/python"
export PYTHONUTF8=1

background() { setsid nohup "$@" >/dev/null 2>&1 & }

case "${1:-}" in
  ""|--app)
    background "$PY" host/tessera_tray.py
    background "$PY" host/tessera_app.py --editor ;;
  --setup)        echo "Nothing to set up: the package provides the dependencies." ;;
  --uninstall)    echo "Remove the package with pacman. Your data is in $DATA (delete it to purge)." ;;
  --diagnostics)  exec "$PY" host/setup_tool.py diagnostics ;;
  --terminal)     exec "$PY" host/tessera_terminal.py ;;
  --tray)         background "$PY" host/tessera_tray.py ;;
  --check|--no-browser) exec "$PY" host/tessera_app.py "$@" ;;
  *)              background "$PY" host/tessera_app.py "$@" ;;
esac
