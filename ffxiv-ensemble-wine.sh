#!/bin/bash
WINEPREFIX="$HOME/.local/share/ffxiv-ensemble-wine"
GAME_DIR="/opt/ffxiv-ensemble-wine"

if [ ! -d "$WINEPREFIX" ]; then
  echo "初始化 Wine 前缀中……"
  wineboot -i
fi

cd "$GAME_DIR" || exit 1
exec wine FFDash.exe

