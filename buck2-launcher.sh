#!/bin/bash

# Buck2 launcher script for dotslash
APP_DIR="/usr/lib/buck2-bin"
DOTSLASH_FILE="$APP_DIR/buck2.dotslash.json"

# 检查 dotslash 是否可用
if ! command -v dotslash >/dev/null 2>&1; then
	echo "Error: dotslash is required but not installed. Please install dotslash." >&2
	exit 1
fi

# 检查配置文件是否存在
if [[ ! -f "$DOTSLASH_FILE" ]]; then
	echo "Error: Buck2 dotslash configuration not found at $DOTSLASH_FILE" >&2
	exit 1
fi

# 设置缓存目录（可选）
CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/buck2-bin"
if [[ -w "$CACHE_DIR" ]] || mkdir -p "$CACHE_DIR" 2>/dev/null; then
	export DOTSLASH_CACHE="$CACHE_DIR"
else
	echo "Warning: Cannot write to cache directory $CACHE_DIR, using system default" >&2
fi

# 执行 Buck2
exec dotslash "$DOTSLASH_FILE" "$@"
