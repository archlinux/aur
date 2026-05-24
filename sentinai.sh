#!/usr/bin/env bash
# SentinAI per-user launcher
set -euo pipefail

APP_DIR="/opt/sentinai"
CFG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/sentinai"
DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/sentinai"
WORK_DIR="$(mktemp -d -t sentinai.XXXXXX)"
trap 'rm -rf "$WORK_DIR"' EXIT

mkdir -p "$CFG_DIR" "$DATA_DIR/osints" "$DATA_DIR/wordlists"

if [[ ! -f "$CFG_DIR/.env" ]]; then
    cp "$APP_DIR/.env.example" "$CFG_DIR/.env"
    echo "[SentinAI] Config created at $CFG_DIR/.env — add your GOOGLE_API_KEY."
fi

for f in app.py chatbot.py custom_widgets.py osintai.py passgenai.py utils.py; do
    ln -s "$APP_DIR/$f" "$WORK_DIR/$f"
done
ln -s "$APP_DIR/icons"      "$WORK_DIR/icons"
ln -s "$CFG_DIR/.env"       "$WORK_DIR/.env"
ln -s "$DATA_DIR/osints"    "$WORK_DIR/osints"
ln -s "$DATA_DIR/wordlists" "$WORK_DIR/wordlists"

export PATH="/opt/sentinai/.venv/bin:$PATH"
exec /opt/sentinai/.venv/bin/python "$WORK_DIR/app.py" "$@"
