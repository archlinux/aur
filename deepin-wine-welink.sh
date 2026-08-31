#!/bin/sh
# 自包含 WoW64 启动器：新版 WeLink（7.53.x）的内置 exe 为 32 位，
# 上游 spark deb 面向 spark-wine。Arch 上无 spark-wine，且经典 32 位的
# deepin-wine6 已因上游源失效 + multilib 移除 lib32 依赖而难以安装。
# deepin-wine8-stable 是 new-WoW64，无法驱动经典 win32 容器，但可用
# win64 容器通过 WoW64 运行 32 位 WeLink.exe。故此处自建 win64 容器，
# 只解出 WeLink 应用本体（不覆盖容器的 windows 系统树）。
set -e

APPRUN="deepin-wine8-stable"
PKG="com.huaweicloud.welink.spark"
FILES="/opt/apps/${PKG}/files"

export WINEPREFIX="${HOME}/.deepinwine/Spark-Welink"
export WINEARCH="win64"
export WINEDLLOVERRIDES="mscoree=,mshtml="
export WINEDEBUG="${WINEDEBUG:-fixme-all}"
# CEF/Electron 应用在 wine 下常因输入法桥接异常导致输入框无响应；
# 允许用户用 WELINK_IM=1 保留输入法（中文输入），默认关闭以保证登录可输入。
[ -z "${WELINK_IM}" ] && export XMODIFIERS="@im=none"

VER_FILE="${WINEPREFIX}/.welink_version"
CUR_VER="$(cat "${FILES}/files.md5sum" 2>/dev/null || echo unknown)"

deploy() {
    echo "==> 正在部署 WeLink 到 ${WINEPREFIX}（首次或升级，需要一些时间）..."
    rm -rf "${WINEPREFIX}"
    "${APPRUN}" wineboot -u >/dev/null 2>&1
    7z x -aoa "${FILES}/files.7z" "drive_c/Program Files/WeLink/*" -o"${WINEPREFIX}" >/dev/null
    printf '%s' "${CUR_VER}" > "${VER_FILE}"
    echo "==> 部署完成。"
}

case "$1" in
    -r|--redeploy) rm -f "${VER_FILE}"; shift ;;
    -h|--help)
        echo "用法: deepin-wine-welink [-r|--redeploy] [-h|--help]"
        echo "  -r  强制重新部署 wine 容器"
        echo "  环境变量 WELINK_IM=1 可保留输入法（中文输入）"
        exit 0 ;;
esac

if [ ! -f "${VER_FILE}" ] || [ "$(cat "${VER_FILE}")" != "${CUR_VER}" ]; then
    deploy
fi

exec "${APPRUN}" explorer /desktop=WeLink,1280x800 \
    "C:/Program Files/WeLink/WeLink.exe" --no-sandbox --disable-gpu "$@"