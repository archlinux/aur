#!/bin/bash
# 蓝色星原：旅谣 —— Linux 启动器
# 模式：
#   azur-promilia                常规启动（登录态已由登录器保持时用这个）
#   azur-promilia --bridge       桥接登录模式（登录失效时用，登录面板显示在 Linux 原生窗口）
#   azur-promilia --install [包] 首次安装：运行官方启动器安装包并检查安装结果
#   azur-promilia --status       查看安装状态与下一步该做什么（--check 同义）
#   azur-promilia --restore      把游戏目录里的官方 SDK 还原（桥接异常退出后使用）
#   azur-promilia --fix-x        重启 Xwayland，清理泄漏的 X11 连接
set -euo pipefail

GAME_ROOT="${AZUR_GAME_ROOT:-$HOME/Games/AzurPromilia}"
PROTON="${AZUR_PROTON:-/usr/share/steam/compatibilitytools.d/dwproton/proton}"
BRIDGE_DIR="${AZUR_BRIDGE_DIR:-/usr/share/azur-promilia}"
OFFICIAL_URL="${AZUR_OFFICIAL_URL:-https://azurpromilia.manjuu.com/}"

DRIVE_DIR="$GAME_ROOT/drive"
INSTALL_DIR="$DRIVE_DIR/AzurPromilia"
GAME_DIR="$INSTALL_DIR/AzurPromilia_Game"
PREFIX_DIR="$GAME_ROOT/prefix"
WIN_INSTALL_DIR='Y:\AzurPromilia'

have() { command -v "$1" >/dev/null 2>&1; }
gui() { [ -n "${DISPLAY:-}${WAYLAND_DISPLAY:-}" ]; }

# 桌面图标启动时没有终端，错误必须用通知露出来，否则就是「点了没反应」
notify() {
    local summary=$1 body=${2:-}
    gui || return 0
    if have notify-send; then
        notify-send -a "蓝色星原" -i azur-promilia -t 10000 "$summary" "$body" 2>/dev/null || true
    elif have kdialog; then
        { kdialog --title "蓝色星原" --error "$summary

$body" >/dev/null 2>&1 & } || true
    elif have zenity; then
        { zenity --error --title="蓝色星原" --text="$summary

$body" >/dev/null 2>&1 & } || true
    fi
    return 0
}

die() {
    echo "错误：$*" >&2
    notify "启动失败" "$*"
    exit 1
}

# 目录布局是固定的：Y:\AzurPromilia 下放官方启动器（版本子目录）和 AzurPromilia_Game
ensure_layout() {
    mkdir -p "$INSTALL_DIR" "$PREFIX_DIR/pfx/dosdevices"
    local link="$PREFIX_DIR/pfx/dosdevices/y:"
    if [ ! -e "$link" ]; then
        ln -sfn "$DRIVE_DIR" "$link"
    elif [ -L "$link" ] && [ "$(readlink "$link")" != "$DRIVE_DIR" ]; then
        ln -sfn "$DRIVE_DIR" "$link"
    fi
}

setup_env() {
    export STEAM_COMPAT_DATA_PATH="$PREFIX_DIR"
    export STEAM_COMPAT_CLIENT_INSTALL_PATH="${STEAM_COMPAT_CLIENT_INSTALL_PATH:-$HOME/.steam/steam}"
    export WINEDEBUG="${AZUR_WINEDEBUG:--all}"

    # X11 授权（Xwayland 的 xauth 文件名每次会话都不同，必须动态取）
    if [ -z "${XAUTHORITY:-}" ]; then
        local xauto
        xauto="$(ps -o args= -C Xwayland 2>/dev/null | grep -oE '\-auth [^ ]+' | awk '{print $2}' | head -1 || true)"
        [ -n "$xauto" ] && export XAUTHORITY="$xauto"
    fi
    export DISPLAY="${DISPLAY:-:0}"

    # 本地可选配置（不随包分发）：~/.config/azur-promilia/env
    # 例如写入：export AZUR_DXVK_HUD="fps,frametimes,version,gpuload"
    local conf="${XDG_CONFIG_HOME:-$HOME/.config}/azur-promilia/env"
    [ -f "$conf" ] && . "$conf"

    # 帧率监控默认关闭；设置 AZUR_DXVK_HUD 才启用
    [ -n "${AZUR_DXVK_HUD:-}" ] && export DXVK_HUD="$AZUR_DXVK_HUD"

    RUN=()
    if [ "${AZUR_MANGOHUD:-0}" = "1" ]; then
        have mangohud || die "AZUR_MANGOHUD=1 但未安装 mangohud"
        RUN=(mangohud)
    fi
}

# 版本目录会随更新变化（1.0.2.2/launcher.exe），取版本号最大的一个
find_launcher() {
    find "$INSTALL_DIR" -maxdepth 3 -name launcher.exe \
        -not -path "$GAME_DIR/*" -printf '%p\n' 2>/dev/null | sort -V | tail -1
}

game_ready() { [ -f "$GAME_DIR/AzurPromilia.exe" ]; }

# 把 Linux 路径转成 Wine 路径：游戏目录用 Y:，其它用 Z:
win_path() {
    local path=$1 rel
    if [ "${path#"$DRIVE_DIR"/}" != "$path" ]; then
        rel="${path#"$DRIVE_DIR"/}"
        printf 'Y:\\%s' "${rel//\//\\}"
    else
        printf 'Z:%s' "${path//\//\\}"
    fi
}

# 在常见下载目录里找官方安装包；找到多个就报错让用户指定，避免装错东西
find_installer() {
    local dirs=("$PWD" "$HOME/Downloads" "$HOME/下载")
    [ -n "${AZUR_INSTALLER_DIR:-}" ] && dirs+=("$AZUR_INSTALLER_DIR")
    local found=() dir file
    for dir in "${dirs[@]}"; do
        [ -d "$dir" ] || continue
        while IFS= read -r file; do
            [ -n "$file" ] || continue
            case " ${found[*]-} " in
                *" $file "*) continue ;;
            esac
            found+=("$file")
        done < <(
            find "$dir" -maxdepth 1 -type f -iname '*.exe' \
                \( -iname '*蓝色星原*' -o -iname '*azur*promilia*' \
                   -o -iname '*launcher*setup*' -o -iname '*yostar*' \) \
                -printf '%T@ %p\n' 2>/dev/null | sort -rn | cut -d' ' -f2-
        )
    done

    [ "${#found[@]}" -gt 0 ] || return 1
    if [ "${#found[@]}" -gt 1 ]; then
        echo "找到多个可能的安装包：" >&2
        printf '  %s\n' "${found[@]}" >&2
        return 2
    fi
    printf '%s\n' "${found[0]}"
}

guide_no_launcher() {
    cat >&2 <<EOF
还没有安装官方启动器。

  1. 从官网下载 PC 客户端安装包（国服）：
     $OFFICIAL_URL
  2. 运行：azur-promilia --install <下载好的安装包.exe>
     安装位置请填 $WIN_INSTALL_DIR
  3. 装好后运行 azur-promilia，在启动器里下载游戏本体。

把安装包放在 ~/Downloads 或当前目录时，可以直接运行 azur-promilia --install，
脚本会自动找出来；找到多个会用列表让你指定。
EOF
    notify "未安装官方启动器" "运行 azur-promilia --install 安装，或先到官网下载 PC 客户端。"
}

guide_no_game() {
    cat >&2 <<EOF
官方启动器已经装好，但游戏本体还没下载完。

  在启动器里把「安装位置」设为 $WIN_INSTALL_DIR
  （对应 $INSTALL_DIR），本体和资源会下载到 AzurPromilia_Game。
  下载完成后运行 azur-promilia --status 确认，再开始游戏。
EOF
    notify "游戏本体未安装" "在官方启动器里把安装位置设为 Y:\\AzurPromilia 并下载本体。"
}

open_official() {
    [ "${AZUR_NO_OPEN:-0}" = "1" ] && return 0
    gui || return 0
    have xdg-open || return 0
    { xdg-open "$OFFICIAL_URL" >/dev/null 2>&1 & } || true
}

install_launcher() {
    ensure_layout
    setup_env
    [ -x "$PROTON" ] || die "找不到 Proton：$PROTON（需安装 dwproton-bin）"

    local installer=${1:-} rc=0
    if [ -z "$installer" ]; then
        installer="$(find_installer)" || rc=$?
        if [ "$rc" -eq 2 ]; then
            die "有多个候选安装包，请用 --install <路径> 指定要装哪一个"
        elif [ "$rc" -ne 0 ] || [ -z "$installer" ]; then
            echo "没有在 ~/Downloads、当前目录找到官方启动器安装包。" >&2
            echo "请从官网下载：$OFFICIAL_URL" >&2
            open_official
            notify "未找到安装包" "请从官网下载 PC 客户端，或把安装包放到 ~/Downloads 后重试。"
            exit 3
        fi
        echo "自动选用安装包：$installer"
    fi

    [ -f "$installer" ] || die "安装包不存在：$installer"
    installer="$(realpath -- "$installer")"

    echo "在 $PREFIX_DIR 里运行官方安装包；首次会初始化 Proton 前缀，可能要几分钟……"
    echo "安装器窗口出来后，把「安装位置」改成 $WIN_INSTALL_DIR（对应 $INSTALL_DIR）。"
    "$PROTON" run "$(win_path "$installer")" || die "安装包运行失败（退出码 $?），日志可看 AZUR_WINEDEBUG=-all 或终端输出"

    local launcher
    launcher="$(find_launcher)"
    [ -n "$launcher" ] || die "安装结束后没找到 launcher.exe，请确认安装时选了 $WIN_INSTALL_DIR"
    echo
    echo "官方启动器已安装：$launcher"
    echo "下一步：运行 azur-promilia，在启动器里把游戏安装位置设为 $WIN_INSTALL_DIR 并下载本体。"
    guide_nofade
    notify "启动器安装完成" "运行 azur-promilia 下载本体，安装位置选 Y:\\AzurPromilia。"
}

x11_client_count() {
    have lsof || return 0
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
        notify "X11 连接数告警" "连接数已达 $n，建议先运行 azur-promilia --fix-x"
        [ "${AZUR_X11_PREFLIGHT:-warn}" = "strict" ] && exit 2
    fi
    return 0
}

fix_xwayland() {
    local xp i
    xp="$(pgrep -x Xwayland | head -1 || true)"
    [ -n "$xp" ] || die "没有运行中的 Xwayland"
    echo "重启 Xwayland（pid=$xp）……"
    kill "$xp" 2>/dev/null || true
    for i in $(seq 1 15); do
        sleep 1
        [ -n "$(pgrep -x Xwayland | head -1)" ] && break
    done
    xp="$(pgrep -x Xwayland | head -1 || true)"
    [ -n "$xp" ] || die "Xwayland 没有自动重启，请注销后重新登录"
    echo "新 Xwayland pid=$xp，当前连接数：$(x11_client_count)"
}

row() {
    printf '  %s：%s\n' "$1" "$2"
}

status_report() {
    ensure_layout

    echo "── 蓝色星原：旅谣 安装状态 ─────────────────────"
    row "游戏根目录" "$GAME_ROOT"
    if [ -f "$PREFIX_DIR/pfx/system.reg" ]; then
        row "Proton 前缀" "$PREFIX_DIR（已初始化）"
    else
        row "Proton 前缀" "$PREFIX_DIR（未初始化，首次启动时自动创建）"
    fi
    if [ -L "$PREFIX_DIR/pfx/dosdevices/y:" ]; then
        row "Y: 映射" "→ $(readlink "$PREFIX_DIR/pfx/dosdevices/y:")"
    else
        row "Y: 映射" "缺失"
    fi

    local launcher
    launcher="$(find_launcher)"
    if [ -n "$launcher" ]; then
        row "官方启动器" "${launcher#"$INSTALL_DIR"/}"
    else
        row "官方启动器" "未安装"
    fi

    if game_ready; then
        row "游戏本体" "$GAME_DIR/AzurPromilia.exe"
    elif [ -d "$GAME_DIR" ]; then
        row "游戏本体" "$GAME_DIR（不完整，缺 AzurPromilia.exe）"
    else
        row "游戏本体" "未安装"
    fi

    local sdk="$GAME_DIR/AzurPromilia_Data/Plugins/mj_sdk"
    if [ -f "$sdk/union_pcsdk.dll" ] && [ -f "$sdk/manjuu_sdk_browser.exe" ]; then
        row "官方 SDK" "就绪"
    else
        row "官方 SDK" "未就绪"
    fi

    if [ -f "$BRIDGE_DIR/run.py" ] && [ -x "$BRIDGE_DIR/build/selected/azur-sdk-host.exe" ]; then
        row "SDK 桥接" "就绪"
    else
        row "SDK 桥接" "缺失（$BRIDGE_DIR）"
    fi
    row "反虚化补丁" "$(nofade_state_word)"

    if python3 -c 'import PyQt6.QtWidgets' >/dev/null 2>&1; then
        row "PyQt6" "就绪"
    else
        row "PyQt6" "缺失（安装 python-pyqt6）"
    fi

    if [ ! -x "$PROTON" ]; then
        row "Proton" "缺失（$PROTON）"
    elif [ -f "$(dirname "$PROTON")/version" ]; then
        row "Proton" "$(cut -d' ' -f2- "$(dirname "$PROTON")/version" 2>/dev/null)"
    else
        row "Proton" "$PROTON"
    fi
    echo "────────────────────────────────────────────────"

    if [ -z "$launcher" ]; then
        guide_no_launcher
        return 3
    fi
    if ! game_ready; then
        guide_no_game
        return 3
    fi

    # 本体齐全时才做 SDK 哈希校验：版本不对会直接拦下来，避免桥接装到新 SDK 上
    local out rc=0
    out="$(python3 "$BRIDGE_DIR/run.py" --game "$GAME_DIR" --check 2>&1)" || rc=$?
    if [ "$rc" -eq 0 ]; then
        echo "检查通过：SDK 哈希与桥接匹配，可以启动。"
        guide_nofade
        return 0
    fi
    echo "检查未通过：" >&2
    printf '%s\n' "$out" | sed 's/^/  /' >&2
    notify "启动器检查未通过" "$(printf '%s' "$out" | tail -1)"
    return 1
}

start_game() {
    ensure_layout
    setup_env
    [ -x "$PROTON" ] || die "找不到 Proton：$PROTON（需安装 dwproton-bin）"

    local launcher
    launcher="$(find_launcher)"
    if [ -z "$launcher" ]; then
        guide_no_launcher
        exit 3
    fi

    # 本体还没下完也允许进启动器：下载/更新本来就是启动器的活
    if ! game_ready; then
        echo "提示：游戏本体尚未安装完，启动器里请把安装位置设为 $WIN_INSTALL_DIR。" >&2
        notify "游戏本体未安装" "在启动器里把安装位置设为 Y:\\AzurPromilia 并下载本体。"
    fi

    x11_preflight
    exec ${RUN[@]+"${RUN[@]}"} "$PROTON" run "$(win_path "$launcher")"
}

bridge_login() {
    ensure_layout
    setup_env
    [ -f "$BRIDGE_DIR/run.py" ] || die "找不到桥接：$BRIDGE_DIR/run.py（重装本包）"
    have python3 || die "需要 python3"
    [ -x "$PROTON" ] || die "找不到 Proton：$PROTON（需安装 dwproton-bin）"

    local launcher
    launcher="$(find_launcher)"
    if [ -z "$launcher" ]; then
        guide_no_launcher
        exit 3
    fi
    if ! game_ready; then
        guide_no_game
        exit 3
    fi

    x11_preflight
    exec ${RUN[@]+"${RUN[@]}"} python3 "$BRIDGE_DIR/run.py" --game "$GAME_DIR" -- \
        "$PROTON" run "$(win_path "$launcher")"
}

restore_sdk() {
    ensure_layout
    [ -f "$BRIDGE_DIR/run.py" ] || die "找不到桥接：$BRIDGE_DIR/run.py（重装本包）"
    [ -d "$GAME_DIR" ] || die "找不到游戏目录：$GAME_DIR"
    exec python3 "$BRIDGE_DIR/run.py" --game "$GAME_DIR" --restore
}

usage() {
    cat <<EOF
用法：azur-promilia [选项]

  （无参数）      常规启动：用 dwproton 拉起官方登录器
  --install [包]  首次安装：运行官方启动器安装包（不带路径时自动在下载目录里找）
  --status        查看安装状态和下一步该做什么（--check 同义）
  --bridge        桥接登录：登录面板显示在 Linux 原生窗口（登录失效时用）
  --restore       把游戏目录里的官方 SDK 还原（桥接异常退出后使用）
  --fix-x         重启 Xwayland，清理泄漏的 X11 连接（启动「秒退」时用）
  --nofade        反虚化补丁：status | install --accept-risk | restore
                  （仅国服；需要构建时用 NOFADE=1，默认不含补丁）

首次使用顺序：
  azur-promilia --install      # 装官方启动器
  azur-promilia                # 进启动器下载游戏本体
  azur-promilia --status       # 确认本体 / SDK / 桥接就绪
  azur-promilia --bridge       # 需要登录时，在原生窗口里登录

环境变量：
  AZUR_GAME_ROOT    游戏根目录（默认 ~/Games/AzurPromilia）
  AZUR_PROTON       Proton 可执行文件（默认 compatibilitytools.d/dwproton/proton）
  AZUR_BRIDGE_DIR   桥接目录（默认 /usr/share/azur-promilia）
  AZUR_INSTALLER_DIR 额外的安装包搜索目录
  AZUR_OFFICIAL_URL 官方下载页（默认国服官网）
  AZUR_NO_OPEN      设 1 时 --install 不自动打开浏览器
  AZUR_DXVK_HUD     DXVK 覆盖层（默认关闭；如 fps,frametimes,version,gpuload）
  AZUR_MANGOHUD     设 1 用 MangoHud 替代 DXVK HUD
  AZUR_X11_MAX_CLIENTS   预检阈值（默认 240）
  AZUR_X11_PREFLIGHT     warn（默认，只警告）或 strict（直接拒绝启动）
EOF
}


# ── 可选：反虚化补丁（仅国服；构建时 NOFADE=1 才会装进包里）────────────
NOFADE_DIR="${AZUR_NOFADE_DIR:-/usr/share/azur-promilia/nofade}"
NOFADE_REL=".res/default_package/BundleFiles/rjmh704fkrsjimysndpsg.r"

nofade_target() { printf '%s\n' "$GAME_DIR/AzurPromilia_Data/$NOFADE_REL"; }
nofade_backup() { printf '%s\n' "$GAME_DIR/.nofade-backup/rjmh704fkrsjimysndpsg.r"; }
nofade_md5()    { md5sum "$1" 2>/dev/null | awk '{print $1}'; }

nofade_meta() {
    [ -f "$NOFADE_DIR/patch.json" ] || return 1
    python3 - "$NOFADE_DIR/patch.json" "$1" <<'PYEOF'
import json, sys
print(json.load(open(sys.argv[1])).get(sys.argv[2], ''))
PYEOF
}

nofade_cmd() {
    local sub="${1:-status}" tgt orig patched cur bk
    if [ ! -f "$NOFADE_DIR/patch.json" ]; then
        cat >&2 <<'EOF'
此包构建时没有启用反虚化补丁。
需要的话，重新构建时加环境变量：NOFADE=1 makepkg -si
EOF
        return 1
    fi
    tgt="$(nofade_target)"
    orig="$(nofade_meta original_md5)"
    patched="$(nofade_meta patched_md5)"

    case "$sub" in
        status)
            [ -f "$tgt" ] || die "找不到游戏资源文件：$tgt"
            cur="$(nofade_md5 "$tgt")"
            if   [ "$cur" = "$patched" ]; then echo "状态：已应用反虚化"
            elif [ "$cur" = "$orig" ];    then echo "状态：原始资源（未应用）"
            else
                echo "状态：无法识别的资源版本"
                echo "  当前 md5：$cur"
                echo "  补丁期望：$orig"
                echo "  游戏更新后补丁多半已失效，请等上游发布新版本。"
            fi
            ;;
        install)
            if [ "${2:-}" != "--accept-risk" ] && [ "${AZUR_NOFADE_ACCEPT:-0}" != "1" ]; then
                cat >&2 <<'EOF'
反虚化会替换客户端资源包，属于修改客户端文件，违反游戏用户协议，可能导致封号。
确认自行承担风险后，重新执行：

    azur-promilia --nofade install --accept-risk

EOF
                return 2
            fi
            [ -f "$tgt" ] || die "找不到游戏资源文件：$tgt"
            cur="$(nofade_md5 "$tgt")"
            [ "$cur" = "$patched" ] && { echo "已经是反虚化状态，无需重复安装"; return 0; }
            if [ "$cur" != "$orig" ]; then
                die "拒绝安装：当前资源 md5 与补丁期望不符（游戏可能已更新）
  当前：$cur
  期望：$orig"
            fi
            bk="$(nofade_backup)"
            mkdir -p "$(dirname "$bk")"
            [ -f "$bk" ] || cp -p -- "$tgt" "$bk"
            cp -f -- "$NOFADE_DIR/rjmh704fkrsjimysndpsg.r" "$tgt"
            if [ "$(nofade_md5 "$tgt")" = "$patched" ]; then
                echo "已应用反虚化；原文件备份在 $(dirname "$bk")"
            else
                cp -f -- "$bk" "$tgt"
                die "应用后校验失败，已自动还原"
            fi
            ;;
        restore)
            bk="$(nofade_backup)"
            [ -f "$bk" ] || die "没有找到备份：$bk"
            cp -f -- "$bk" "$tgt"
            [ "$(nofade_md5 "$tgt")" = "$orig" ] && echo "已还原为原始资源" \
                || die "还原后校验失败，请用官方启动器修复客户端"
            ;;
        *)
            die "用法：azur-promilia --nofade [status|install --accept-risk|restore]"
            ;;
    esac
}

# 反虚化当前状态（供状态报告与安装指引复用）
nofade_state_word() {
    local tgt orig patched cur
    [ -f "$NOFADE_DIR/patch.json" ] || { printf '%s' "未打包"; return; }
    tgt="$(nofade_target)"
    [ -f "$tgt" ] || { printf '%s' "未安装本体"; return; }
    orig="$(nofade_meta original_md5)"
    patched="$(nofade_meta patched_md5)"
    cur="$(nofade_md5 "$tgt")"
    if   [ "$cur" = "$patched" ]; then printf '%s' "已应用"
    elif [ "$cur" = "$orig" ];    then printf '%s' "可用（未应用）"
    else printf '%s' "版本不匹配（等上游更新）"; fi
}

# 安装/自检末尾统一提示反虚化选项
guide_nofade() {
    local st
    st="$(nofade_state_word)"
    [ "$st" = "未打包" ] && return 0
    echo
    echo "可选：反虚化补丁（仅国服）——当前状态：$st"
    echo "  会替换客户端资源包，属修改客户端，违反用户协议，风险自负。"
    echo "  azur-promilia --nofade status"
    echo "  azur-promilia --nofade install --accept-risk"
    echo "  azur-promilia --nofade restore"
}

MODE="${1:-}"
case "$MODE" in
    "")
        start_game
        ;;
    --install|install)
        shift
        install_launcher "${1:-}"
        ;;
    --status|--check|status|check)
        status_report
        ;;
    --bridge|bridge)
        bridge_login
        ;;
    --restore)
        restore_sdk
        ;;
    --fix-x|--fix-xwayland)
        fix_xwayland
        ;;
    --nofade)
        shift
        nofade_cmd "$@"
        ;;
    -h|--help|help)
        usage
        ;;
    *)
        die "未知参数：$MODE（用 --help 查看用法）"
        ;;
esac
