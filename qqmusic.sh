#!/usr/bin/env bash
# DO NOT EDIT, it's updated in PKGBUILD

FLAGS=()
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    FLAGS+=("--ozone-platform=x11")
fi

# 禁用 Chromium 内置缩放 MPRIS 服务，由主进程原生 D-Bus 桥接提供
FLAGS+=("--disable-features=MediaSessionService,SystemMediaControls")

exec /usr/bin/__ELECTRON__ "${FLAGS[@]}" /usr/lib/qqmusic/app.asar "$@"
