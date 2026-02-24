#!/usr/bin/env bash
set -euo pipefail

APP_DIR="/opt/blockdeletee"
CFG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/blockdeletee"
CFG_FILE="${CFG_DIR}/config.json"

mkdir -p "$CFG_DIR"

if [[ ! -f "$CFG_FILE" ]]; then
  cp "$APP_DIR/config.example.json" "$CFG_FILE"
  echo "[BlockDeletee] Создан шаблон конфига: $CFG_FILE" >&2
  echo "[BlockDeletee] Заполни RCON host/password/player_name и запусти снова." >&2
fi

# Keep relative paths from config working when config lives in ~/.config/blockdeletee.
# blocks.json and models are shipped by the package in /opt/blockdeletee.
if [[ ! -e "$CFG_DIR/blocks.json" ]]; then
  ln -s "$APP_DIR/blocks.json" "$CFG_DIR/blocks.json"
fi
if [[ ! -e "$CFG_DIR/models" ]]; then
  ln -s "$APP_DIR/models" "$CFG_DIR/models"
fi

cd "$APP_DIR"
exec ./blockdeletee --config "$CFG_FILE" "$@"
