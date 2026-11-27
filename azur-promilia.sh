#!/bin/bash
# 蓝色星原：旅谣 —— Linux 启动器
# 两种模式：
#   azur-promilia            常规启动（登录态已由登录器保持时用这个）
#   azur-promilia --bridge   桥接登录模式（登录失效时用，登录面板会显示在 Linux 原生窗口）
set -euo pipefail

GAME_ROOT="${AZUR_GAME_ROOT:-$HOME/Games/AzurPromilia}"
PROTON="${AZUR_PROTON:-/usr/share/steam/compatibilitytools.d/dwproton/proton}"
BRIDGE_DIR="${AZUR_BRIDGE_DIR:-/usr/share/azur-promilia}"

GAME_DIR="$GAME_ROOT/drive/AzurPromilia/AzurPromilia_Game"
PREFIX_DIR="$GAME_ROOT/prefix"

die() { echo "错误：$*" >&2; exit 1; }

[ -x "$PROTON" ] || die "找不到 Proton：$PROTON（需安装 dwproton-bin）"
[ -d "$GAME_DIR" ] || die "找不到游戏目录：$GAME_DIR
可用环境变量 AZUR_GAME_ROOT 指定（默认 ~/Games/AzurPromilia）"
[ -d "$PREFIX_DIR" ] || die "找不到 prefix：$PREFIX_DIR"

# 找到已安装的启动器（版本目录会随更新变化）
LAUNCHER="$(find "$GAME_ROOT/drive/AzurPromilia" -maxdepth 2 -name launcher.exe -printf '%h\n' 2>/dev/null | sort -V | tail -1)"
[ -n "$LAUNCHER" ] || die "找不到 launcher.exe"
LAUNCHER_WIN="Y:${LAUNCHER#"$GAME_ROOT/drive"}"

# X11 授权（Xwayland 的 xauth 文件名每次会话都不同，必须动态取）
if [ -z "${XAUTHORITY:-}" ]; then
    XAUTO="$(ps -o args= -C Xwayland 2>/dev/null | grep -oE '\-auth [^ ]+' | awk '{print $2}' | head -1 || true)"
    [ -n "$XAUTO" ] && export XAUTHORITY="$XAUTO"
fi
export DISPLAY="${DISPLAY:-:0}"

# Y: 盘映射（游戏装在 drive/ 下，SDK 需要 Y: 根目录可写）
mkdir -p "$PREFIX_DIR/pfx/dosdevices"
[ -e "$PREFIX_DIR/pfx/dosdevices/y:" ] || ln -sfn "$GAME_ROOT/drive" "$PREFIX_DIR/pfx/dosdevices/y:"

export STEAM_COMPAT_DATA_PATH="$PREFIX_DIR"
export STEAM_COMPAT_CLIENT_INSTALL_PATH="${STEAM_COMPAT_CLIENT_INSTALL_PATH:-$HOME/.steam/steam}"
export WINEDEBUG="${AZUR_WINEDEBUG:--all}"

case "${1:-}" in
    --bridge|bridge)
        [ -f "$BRIDGE_DIR/run.py" ] || die "找不到桥接：$BRIDGE_DIR/run.py"
        command -v python3 >/dev/null || die "需要 python3"
        exec python3 "$BRIDGE_DIR/run.py" --game "$GAME_DIR" -- "$PROTON" run "$LAUNCHER_WIN"
        ;;
    --restore)
        exec python3 "$BRIDGE_DIR/run.py" --game "$GAME_DIR" --restore
        ;;
    --check)
        exec python3 "$BRIDGE_DIR/run.py" --game "$GAME_DIR" --check
        ;;
    -h|--help|help)
        cat <<EOF
用法：azur-promilia [选项]

  （无参数）      常规启动：直接用 dwproton 拉起官方登录器
  --bridge       桥接登录：登录面板显示在 Linux 原生窗口（登录失效时用）
  --restore      把游戏目录里的官方 SDK 还原（桥接异常退出后使用）
  --check        检查游戏目录、SDK 哈希、桥接与 PyQt6

环境变量：
  AZUR_GAME_ROOT  游戏根目录（默认 ~/Games/AzurPromilia）
  AZUR_PROTON     Proton 可执行文件（默认 compatibilitytools.d/dwproton/proton）
  AZUR_BRIDGE_DIR 桥接目录（默认 /usr/share/azur-promilia）
EOF
        ;;
    *) die "未知参数：$1（用 --help 查看用法）" ;;
esac
