#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

APP_VERSION=$(grep '"version"' "$PROJECT_ROOT/src-tauri/tauri.conf.json" | head -1 | sed 's/.*"version"[[:space:]]*:[[:space:]]*"\(.*\)".*/\1/')
if [ -z "$APP_VERSION" ]; then
    echo "错误：无法从 tauri.conf.json 提取版本号"
    exit 1
fi
echo "==> Version: $APP_VERSION"

PKGREL=1
echo "==> 查询 AUR 确认 pkgrel..."
AUR_INFO=$(curl -s "https://aur.archlinux.org/rpc/v5/info?arg[]=astrobox-creator-console" 2>/dev/null || true)
AUR_PKGVER=$(echo "$AUR_INFO" | grep -oP '"Version"\s*:\s*"\K[^"]+' | head -1 || true)
if [ -n "$AUR_PKGVER" ]; then
    AUR_VER=$(echo "$AUR_PKGVER" | grep -oP '^\d+\.\d+\.\d+')
    AUR_REL=$(echo "$AUR_PKGVER" | grep -oP '\d+\.\d+\.\d+-\K\d+')
    echo "    AUR 当前: $AUR_VER-$AUR_REL"
    if [ "$AUR_VER" = "$APP_VERSION" ] && [ -n "$AUR_REL" ]; then
        PKGREL=$((AUR_REL + 1))
        echo "    同版本, pkgrel 递增: $AUR_REL -> $PKGREL"
    fi
else
    echo "    无法查询 AUR, pkgrel 默认 1"
fi

PKG_FILE="$PROJECT_ROOT/dist/linux/AstroBoxCreatorConsole-${APP_VERSION}-x86_64.pkg.tar.zst"
if [ ! -f "$PKG_FILE" ]; then
    PKG_FILE="$PROJECT_ROOT/dist/linux/astrobox-creator-console-${APP_VERSION}-${PKGREL}-x86_64.pkg.tar.zst"
fi
if [ ! -f "$PKG_FILE" ]; then
    echo "错误：找不到 dist/linux 下的 arch 包（期望 AstroBoxCreatorConsole-${APP_VERSION}-x86_64.pkg.tar.zst 或 astrobox-creator-console-${APP_VERSION}-${PKGREL}-x86_64.pkg.tar.zst）"
    echo "请先运行 build-linux.sh"
    exit 1
fi

SHA256=$(sha256sum "$PKG_FILE" | awk '{print $1}')
echo "==> sha256: $SHA256"

sed -i "s/^pkgver=.*/pkgver=${APP_VERSION}/" "$SCRIPT_DIR/PKGBUILD"
sed -i "s/^pkgrel=.*/pkgrel=${PKGREL}/" "$SCRIPT_DIR/PKGBUILD"
sed -i "s/local _expected=.*/local _expected=\"${SHA256}\"/" "$SCRIPT_DIR/PKGBUILD"

echo "==> 生成 .SRCINFO..."
cd "$SCRIPT_DIR"
makepkg --printsrcinfo > .SRCINFO

echo "==> 完成: ${APP_VERSION}-${PKGREL}"
