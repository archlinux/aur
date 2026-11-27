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
LAUNCHER="$(find "$GAME_ROOT/drive/AzurPromilia" -maxdepth 2 -name launcher.exe -printf '%p\n' 2>/dev/null | sort -V | tail -1)"
[ -n "$LAUNCHER" ] || die "找不到 launcher.exe"
LAUNCHER_WIN="Y:${LAUNCHER#"$GAME_ROOT/drive"}"
LAUNCHER_WIN="${LAUNCHER_WIN//\//\\}"

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

# 本地可选配置（不随包分发）：~/.config/azur-promilia/env
# 例如写入：export AZUR_DXVK_HUD="fps,frametimes,version,gpuload"
AZUR_CONF="${XDG_CONFIG_HOME:-$HOME/.config}/azur-promilia/env"
[ -f "$AZUR_CONF" ] && . "$AZUR_CONF"

# 帧率监控默认关闭；设置 AZUR_DXVK_HUD 才启用（fps / fps,frametimes,version,gpuload …）
[ -n "${AZUR_DXVK_HUD:-}" ] && export DXVK_HUD="$AZUR_DXVK_HUD"

# X11 客户端槽位预检：Xwayland 默认 256 个连接，泄漏后新客户端会连不上，
# 表现为启动器「秒退」且日志里刷 "Maximum number of clients reached"。
x11_client_count() {
    local xp
    xp="$(pgrep -x Xwayland | head -1)" || return 0
    [ -n "$xp" ] || return 0
    lsof -p "$xp" 2>/dev/null | grep -c 'X11-unix' || true
}

x11_preflight() {
    local n limit
    n="$(x11_client_count)"
    n="${n:-0}"
    limit="${AZUR_X11_MAX_CLIENTS:-240}"
    if [ "$n" -ge "$limit" ]; then
        cat >&2 <<EOF
警告：X11 客户端连接数已达 $n（阈值 $limit），Xwayland 的名额快用完了。

  再启动很可能直接「秒退」，日志里会出现：
      Maximum number of clients reached

  这通常是之前用 kill -9 强杀 Wine/CEF 进程留下的半死连接。
  修复办法（会断开本会话里所有 X11 客户端，Wayland 应用不受影响）：

      azur-promilia --fix-x

EOF
        [ "${AZUR_X11_PREFLIGHT:-warn}" = "strict" ] && exit 2
    fi
    return 0
}

fix_xwayland() {
    local xp i
    xp="$(pgrep -x Xwayland | head -1)"
    [ -n "$xp" ] || die "没有运行中的 Xwayland"
    echo "重启 Xwayland（pid=$xp）……"
    kill "$xp" 2>/dev/null
    for i in $(seq 1 15); do
        sleep 1
        [ -n "$(pgrep -x Xwayland | head -1)" ] && break
    done
    xp="$(pgrep -x Xwayland | head -1)"
    [ -n "$xp" ] || die "Xwayland 没有自动重启，请注销后重新登录"
    echo "新 Xwayland pid=$xp，当前连接数：$(x11_client_count)"
}

# 可选 MangoHud（更详细的帧时间曲线）：AZUR_MANGOHUD=1
RUN=()
if [ "${AZUR_MANGOHUD:-0}" = "1" ]; then
    command -v mangohud >/dev/null || die "AZUR_MANGOHUD=1 但未安装 mangohud"
    RUN=(mangohud)
fi

MODE="${1:-}"

case "$MODE" in
    "")
        # 无参数：常规启动
        x11_preflight
        exec ${RUN[@]+"${RUN[@]}"} "$PROTON" run "$LAUNCHER_WIN"
        ;;
    --bridge|bridge)
        x11_preflight
        [ -f "$BRIDGE_DIR/run.py" ] || die "找不到桥接：$BRIDGE_DIR/run.py"
        command -v python3 >/dev/null || die "需要 python3"
        exec ${RUN[@]+"${RUN[@]}"} python3 "$BRIDGE_DIR/run.py" --game "$GAME_DIR" -- \
            "$PROTON" run "$LAUNCHER_WIN"
        ;;
    --restore)
        exec python3 "$BRIDGE_DIR/run.py" --game "$GAME_DIR" --restore
        ;;
    --fix-x|--fix-xwayland)
        fix_xwayland
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
  --fix-x        重启 Xwayland，清理泄漏的 X11 连接（启动「秒退」时用）

环境变量：
  AZUR_GAME_ROOT    游戏根目录（默认 ~/Games/AzurPromilia）
  AZUR_PROTON       Proton 可执行文件（默认 compatibilitytools.d/dwproton/proton）
  AZUR_BRIDGE_DIR   桥接目录（默认 /usr/share/azur-promilia）
  AZUR_DXVK_HUD     DXVK 覆盖层（默认关闭；如 fps,frametimes,version,gpuload）
  AZUR_MANGOHUD     设 1 用 MangoHud 替代 DXVK HUD
  AZUR_X11_MAX_CLIENTS   预检阈值（默认 240）
  AZUR_X11_PREFLIGHT     warn（默认，只警告）或 strict（直接拒绝启动）
EOF
        ;;
    *) die "未知参数：$MODE（用 --help 查看用法）" ;;
esac
