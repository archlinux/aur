#!/bin/sh
# welink-wine 启动器
#
# 用 Arch 官方 wine 建 win64 容器，经 WoW64 运行 32 位 WeLink.exe。
# 应用本体在首次运行/升级时从 /opt/welink-wine/payload 解到容器里。
#
# 输入框打不进字的两个独立根因及对策（经 CDP 逐层定位、用户实操验证）：
#  1) 中文 locale 下 wine 的键盘布局 HKL 为 0804，Chromium 据此把每个按键都标成
#     VK_PROCESSKEY 交给 IME，而 wine 的 IME 不产生 composition，字符被吞。
#     → 只把 LC_CTYPE 设为 C.UTF-8（键盘布局跟 LC_CTYPE 走，界面语言跟 LANG 走，分开设）。
#  2) 页面给输入框指定 font-family "Microsoft Yahei"；容器里没有该字体时，
#     Chromium(DirectWrite) 逐字符回退拿到的字体会让输入框布局失败、caret 无法建立。
#     → 部署时把系统 Noto Sans CJK SC 改名为 "Microsoft YaHei" 放进容器并登记注册表，
#       让该家族名真实存在。字体在本机生成，不随包分发。
#  另：从开始菜单启动时 stdio 是 journal socket，Node 打不开 stderr 会弹 JS 错误，
#     故 exec 前把 stdio 重定向到 ${DATA}/welink.log。
set -e

PKGDIR="/opt/welink-wine"
PAYLOAD="${PKGDIR}/payload"
DATA="${XDG_DATA_HOME:-${HOME}/.local/share}/welink-wine"
export WINEPREFIX="${DATA}/prefix"
export WINEARCH="win64"
export WINEDLLOVERRIDES="mscoree=,mshtml="
export WINEDEBUG="${WINEDEBUG:-fixme-all}"

APPDIR="${WINEPREFIX}/drive_c/Program Files/WeLink"
VER_FILE="${DATA}/app_version"
CUR_VER="$(cat "${PAYLOAD}/version" 2>/dev/null || echo unknown)"
LEGACY="${HOME}/.deepinwine/Spark-Welink"

msg() { printf '==> %s\n' "$*"; }

# 从旧包(deepin-wine-welink)迁移容器，保留登录与聊天数据
migrate_legacy() {
    [ -d "${WINEPREFIX}" ] && return 0
    [ -d "${LEGACY}/drive_c" ] || return 0
    msg "发现旧容器 ${LEGACY}，迁移到 ${WINEPREFIX}（保留登录数据）..."
    mkdir -p "${DATA}"
    mv "${LEGACY}" "${WINEPREFIX}"
}

# 对策 2：生成并登记 "Microsoft YaHei"/"SimSun" 字体别名，并把 wine 对话框字体指过去
setup_font() {
    _fonts="${WINEPREFIX}/drive_c/windows/Fonts"
    # 版本戳由字体脚本在成功后写入；脚本升级（别名/度量变化）后老容器会自动重新生成
    if [ ! -f "${_fonts}/.welink-fonts-v2" ]; then
        msg "生成中文字体别名 ..."
        python3 "${PKGDIR}/welink-mkfont.py" "${_fonts}" || msg "警告：字体生成失败，输入框可能无法打字"
    fi
    if [ -f "${_fonts}/msyh.otf" ] && ! grep -qi 'welink-wine-fonts' "${WINEPREFIX}/user.reg" 2>/dev/null; then
        _F='HKLM\Software\Microsoft\Windows NT\CurrentVersion\Fonts'
        wine reg add "${_F}" /v 'Microsoft YaHei (OpenType)' /t REG_SZ /d msyh.otf /f >/dev/null 2>&1 || true
        [ -f "${_fonts}/simsun.otf" ] && wine reg add "${_F}" /v 'SimSun (OpenType)' /t REG_SZ /d simsun.otf /f >/dev/null 2>&1 || true
        # 运行时 LC_CTYPE=C 会让 wine 的 GDI 按 ANSI 字符集挑对话框字体（没有汉字→方框），
        # 把 wine 自身/常见 Windows 字体名都替换到有汉字的别名上。Chromium 走 DirectWrite 不受影响。
        _R='HKCU\Software\Wine\Fonts\Replacements'
        # 只替换 wine 对话框用的字体；Arial/Segoe UI 等拉丁字体不要指到 CJK 字体
        # （CJK 字体行高大，会把网页里固定高度容器的文字切掉一半）。
        for _n in 'MS Shell Dlg' 'MS Shell Dlg 2' 'Tahoma' 'Microsoft Sans Serif' 'MS Sans Serif' \
                  'Microsoft YaHei UI' '微软雅黑'; do
            wine reg add "${_R}" /v "${_n}" /t REG_SZ /d 'Microsoft YaHei' /f >/dev/null 2>&1 || true
        done
        for _n in 'NSimSun' '宋体' '新宋体' 'SimHei' '黑体' 'FangSong' '仿宋' 'KaiTi' '楷体'; do
            wine reg add "${_R}" /v "${_n}" /t REG_SZ /d 'SimSun' /f >/dev/null 2>&1 || true
        done
        wine reg add 'HKCU\Software\Wine\Fonts' /v 'welink-wine-fonts' /t REG_SZ /d 1 /f >/dev/null 2>&1 || true
        : # 不用 wineserver -w：有实例在跑时会永远等
    fi
}

# 只替换应用目录，不动 users/（AppData 里是登录态与聊天记录）
deploy_app() {
    msg "部署 WeLink ${CUR_VER} 到容器（首次或升级，需要一些时间）..."
    rm -rf "${APPDIR}"
    mkdir -p "${WINEPREFIX}/drive_c/Program Files"
    for _z in "${PAYLOAD}"/*.7z; do
        7z x -aoa -o"${APPDIR}" "${_z}" >/dev/null
    done
    mkdir -p "${DATA}"
    printf '%s' "${CUR_VER}" > "${VER_FILE}"
    msg "部署完成。"
}

case "$1" in
    -r|--redeploy) rm -f "${VER_FILE}"; shift ;;
    -h|--help)
        echo "用法: welink-wine [-r|--redeploy] [-h|--help] [-- WeLink 参数]"
        echo "  -r  强制重新部署应用文件（不清除登录数据）"
        echo "  环境变量 WELINK_LANG=zh 保持中文 locale 运行（会导致输入框无法打字）"
        exit 0 ;;
esac

migrate_legacy
if [ ! -d "${WINEPREFIX}/drive_c" ]; then
    msg "初始化 wine 容器 ${WINEPREFIX} ..."
    mkdir -p "${WINEPREFIX}"
    wine wineboot -u >/dev/null 2>&1
fi
setup_font
if [ ! -f "${VER_FILE}" ] || [ "$(cat "${VER_FILE}")" != "${CUR_VER}" ] || [ ! -f "${APPDIR}/WeLink.exe" ]; then
    deploy_app
fi

# DPI：wine 默认 96；按桌面缩放写 LogPixels，让 Chromium 以对应 device scale 渲染（否则窗口很小）。
set_dpi() {
    _dpi=$(xrdb -query 2>/dev/null | awk '/^Xft.dpi/{print int($2)}')
    if [ -z "${_dpi}" ]; then
        _sc=$(kscreen-doctor -o 2>/dev/null | grep -m1 -oE 'Scale: [0-9.]+' | awk '{print $2}')
        [ -z "${_sc}" ] && _sc="${GDK_SCALE:-${QT_SCALE_FACTOR:-1}}"
        _dpi=$(awk "BEGIN{d=96*${_sc}; if(d<96)d=96; printf \"%d\", d}")
    fi
    [ -n "${WELINK_DPI}" ] && _dpi="${WELINK_DPI}"
    _cur=$(wine reg query 'HKCU\Control Panel\Desktop' /v LogPixels 2>/dev/null | awk '/LogPixels/{v=$3; sub(/^0x/,"",v); print strtonum("0x" v)}')
    if [ "${_cur:-96}" != "${_dpi}" ]; then
        wine reg add 'HKCU\Control Panel\Desktop' /v LogPixels /t REG_DWORD /d "${_dpi}" /f >/dev/null 2>&1 || true
        wine reg add 'HKCU\Software\Wine\Fonts' /v LogPixels /t REG_DWORD /d "${_dpi}" /f >/dev/null 2>&1 || true
        : # 不用 wineserver -w：有实例在跑时会永远等
    fi
}
set_dpi

# 对策 1：只覆盖 LC_CTYPE，保留 LANG 不动。
#   LC_CTYPE 决定 wine 选用的键盘布局（中文 locale → HKL 0804 → 按键被当成 IME 候选吞掉）；
#   LANG 决定 WeLink 的界面语言。两者分开设置即可"界面中文 + 能打字"。
#   必须放在 wineboot 之后：容器的 Windows 区域在 wineboot 时按当时 locale 写入注册表。
#   只挑系统上确实存在的 locale（写死不存在的会让程序报错）。
if [ "${WELINK_LANG}" != "zh" ]; then
    for _c in C.UTF-8 C.utf8 en_US.UTF-8 en_US.utf8; do
        if locale -a 2>/dev/null | grep -qix "${_c}"; then
            export LC_CTYPE="${_c}"; break
        fi
    done
fi

# 输入法：WeLink 是 XWayland(X11) 客户端，只有带 XMODIFIERS 才会去连 fcitx5/ibus 的 XIM。
# Plasma Wayland 下 KWin 接管 fcitx5 后会话里常常没有这些变量，这里按运行中的框架自动补上。
if [ -z "${XMODIFIERS}" ]; then
    if pgrep -x fcitx5 >/dev/null 2>&1 || pgrep -x fcitx >/dev/null 2>&1; then
        export XMODIFIERS="@im=fcitx" GTK_IM_MODULE="${GTK_IM_MODULE:-fcitx}" QT_IM_MODULE="${QT_IM_MODULE:-fcitx}"
    elif pgrep -x ibus-daemon >/dev/null 2>&1; then
        export XMODIFIERS="@im=ibus" GTK_IM_MODULE="${GTK_IM_MODULE:-ibus}" QT_IM_MODULE="${QT_IM_MODULE:-ibus}"
    fi
fi

# 从桌面/开始菜单启动时 stdout/stderr 是 systemd 交给的 journal socket，wine 把它包成
# Windows 句柄后 Node 打不开 process.stderr（EINVAL uv_pipe_open），主进程直接弹
# "A JavaScript error occurred in the main process"。统一把 stdio 指向普通文件即可。
LOG="${DATA}/welink.log"
mkdir -p "${DATA}"; : > "${LOG}"
exec wine "C:/Program Files/WeLink/WeLink.exe" --no-sandbox --disable-gpu "$@" </dev/null >>"${LOG}" 2>&1
