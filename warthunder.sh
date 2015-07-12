#!/usr/bin/sh
GAME_DIR="$HOME/.local/share/WarThunder"

if [ "$(id -u)" == "0" ]; then
  echo "You really should not run this script as root!"
  exit 0
fi

if [ -z "$HOME" ]; then
  echo "Could not find the HOME directory"
  exit 0
fi

if [ ! -d "$GAME_DIR" ]; then
  echo "War Thunder will be installed to: $GAME_DIR"
  mkdir -p "$GAME_DIR"
fi

cd "$GAME_DIR"
warthunder-updater --noupdate --folder "../../../../$GAME_DIR"
