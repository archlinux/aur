#!/usr/bin/env bash
# DO NOT EDIT, it's updated in PKGBUILD

FLAGS=()
# 在 KDE Plasma Wayland 环境下，使用 XWayland 运行以保证系统托盘图标正常显示，
# 并消除 Wayland 下 Vulkan surface factory 不兼容报错。
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    FLAGS+=("--ozone-platform=x11")
fi

exec /usr/bin/__ELECTRON__ "${FLAGS[@]}" /usr/lib/qqmusic/app.asar "$@"
