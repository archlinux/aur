#!/usr/bin/env bash
set -euo pipefail

APP_VERSION="28"

DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
APPDIR="$DATA_HOME/nsui"
EXE="$APPDIR/New Super Ultimate Injector for 3DS.exe"
VERSION_STAMP="$APPDIR/.nsui-version"

install_or_update_app_files() {
  mkdir -p "$APPDIR"

  if [[ ! -f "$EXE" || "$(cat "$VERSION_STAMP" 2>/dev/null || true)" != "$APP_VERSION" ]]; then
    echo "Installing NSUI files to: $APPDIR"
    cp -a /usr/share/nsui/. "$APPDIR/"

    if [[ -f "$APPDIR/config.ini" ]]; then
      sed -i 's/^language=.*/language=en/' "$APPDIR/config.ini" || true
    fi

    echo "$APP_VERSION" > "$VERSION_STAMP"
  fi
}

install_or_update_app_files

cd "$APPDIR"
exec wine "$EXE" "$@"
