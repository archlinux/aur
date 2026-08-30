#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

echo "==> AstroBox CreatorConsole Arch Linux build"
echo "    Project root: $PROJECT_ROOT"

APP_VERSION=$(grep '"version"' "$PROJECT_ROOT/src-tauri/tauri.conf.json" | head -1 | sed 's/.*"version"[[:space:]]*:[[:space:]]*"\(.*\)".*/\1/')
if [ -z "$APP_VERSION" ]; then
    echo "错误：无法从 tauri.conf.json 提取版本号"
    exit 1
fi
echo "    Version: $APP_VERSION"

rm -f "$SCRIPT_DIR"/astrobox-creator-console-*.pkg.tar.zst

MODE="${1:-prebuilt}"

case "$MODE" in
    "prebuilt")
        echo "==> 预编译模式"

        # 查询 AUR 上当前版本的 pkgrel
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

        PREBUILT_DIR="${PREBUILT_DIR:-$PROJECT_ROOT/src-tauri/target/release}"
        if [ ! -f "$PREBUILT_DIR/astrobox-creator-console" ]; then
            echo "错误：找不到预编译的二进制文件"
            echo "请先运行 bun tauri build --no-bundle"
            exit 1
        fi

        BUILD_DIR="$SCRIPT_DIR/build-prebuilt"
        rm -rf "$BUILD_DIR"
        mkdir -p "$BUILD_DIR/src"

        ln -sf "$PROJECT_ROOT" "$BUILD_DIR/src/AstroBoxCreatorConsole"

        cp "$SCRIPT_DIR/PKGBUILD.prebuilt" "$BUILD_DIR/PKGBUILD"
        sed -i "s/^pkgver=.*/pkgver=${APP_VERSION}/" "$BUILD_DIR/PKGBUILD"
        sed -i "s/^pkgrel=.*/pkgrel=${PKGREL}/" "$BUILD_DIR/PKGBUILD"

        cd "$BUILD_DIR"
        PREBUILT_DIR="$PREBUILT_DIR" PKGDEST="$SCRIPT_DIR" makepkg -d -f "${@:2}"

        echo "    pkgrel=$PKGREL"
        ;;

    *)
        echo "用法：$0 {prebuilt} [makepkg选项]"
        echo ""
        echo "  prebuilt  使用已编译的二进制文件打包"
        exit 1
        ;;
esac

echo "==> Build complete! Package saved to: $SCRIPT_DIR"
echo "    Version: ${APP_VERSION}-${PKGREL}"
