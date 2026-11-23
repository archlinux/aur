#!/usr/bin/bash
# Tessera launcher for the Arch package.
# The host keeps its profiles, logs and locks next to its own code, so the read-only copy in
# /usr/share/tessera is synced into a per-user writable tree, which is then run with the system Python packages.
set -eu
SRC=/usr/share/tessera
DATA="${XDG_DATA_HOME:-$HOME/.local/share}/tessera"
EXTENSION="${XDG_DATA_HOME:-$HOME/.local/share}/gnome-shell/extensions/tessera-windows@tessera"

if [ "${1:-}" = "--gnome-extension" ]; then
  # The GNOME Shell extension that lets Tessera control windows on GNOME Wayland.
  if [ "${2:-}" = "remove" ]; then
    rm -rf "$EXTENSION" && echo "Removed $EXTENSION. Sign in again to unload it."
    exit 0
  fi
  mkdir -p "$(dirname "$EXTENSION")" && rm -rf "$EXTENSION"
  cp -r --no-preserve=mode,ownership "$SRC/host/linux/gnome-extension/tessera-windows@tessera" "$EXTENSION"
  echo "Installed $EXTENSION"
  echo "GNOME loads new extensions at sign-in. Sign out and in again, then run:"
  echo "  gnome-extensions enable tessera-windows@tessera"
  echo "While it is on, any program of your session can read window titles and focus, move or close windows. Turn it off with"
  echo "  gnome-extensions disable tessera-windows@tessera"
  exit 0
fi

if [ "${1:-}" = "--uninstall" ]; then
  # What Tessera put in the user's own folders: the autostart entry, any application menu entries and the GNOME Shell
  # extension. The two entries the package installs live in /usr/share/applications and go with the package
  # (pacman -R tessera-deck).
  config="${XDG_CONFIG_HOME:-$HOME/.config}"
  apps="${XDG_DATA_HOME:-$HOME/.local/share}/applications"
  for file in "$config/autostart/tessera.desktop" "$apps/tessera.desktop" "$apps/tessera-tray.desktop" "$apps/tessera-editor.desktop"; do
    [ -e "$file" ] && rm -f "$file" && echo "Removed $file"
  done
  [ -d "$EXTENSION" ] && rm -rf "$EXTENSION" && echo "Removed $EXTENSION"
  if [ "${2:-}" = "--purge" ]; then
    printf 'This permanently deletes your profiles, icons, backups and downloads in %s. Type YES to continue: ' "$DATA"
    read -r answer
    if [ "$answer" = "YES" ]; then rm -rf "$DATA" && echo "Removed $DATA"; else echo "Your data was kept."; fi
  else
    echo "Your profiles, icons and backups in $DATA were kept. Run again with --purge to delete them too."
  fi
  echo "Remove the program itself with: pacman -R tessera-deck"
  exit 0
fi

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
# pacman updates this copy, so the host refuses its own in-place update (the next start would undo it)
export TESSERA_PACKAGED=1

background() { setsid nohup "$@" >/dev/null 2>&1 & }

case "${1:-}" in
  ""|--tray)     background "$PY" host/tessera_tray.py ;;
  --app)
    background "$PY" host/tessera_tray.py
    background "$PY" host/tessera_app.py --editor ;;
  --editor)       background "$PY" host/tessera_app.py "$@" ;;
  --setup)        echo "Nothing to set up: the package provides the dependencies." ;;
  --diagnostics)  exec "$PY" host/setup_tool.py diagnostics ;;
  --terminal)     exec "$PY" host/tessera_terminal.py ;;
  --check|--no-browser) exec "$PY" host/tessera_app.py "$@" ;;
  *)              background "$PY" host/tessera_app.py "$@" ;;
esac
