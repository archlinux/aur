#!/bin/sh

if command -v fcitx5; then
    export QT_IM_MODULE=fcitx
fi

HERE="$(dirname "$(readlink -f "${0}")")"
VERSION=3.71.1.13000
export LD_LIBRARY_PATH=${HERE}/${VERSION}
export QT_PLUGIN_PATH=${HERE}/${VERSION}/plugins
export QTWEBENGINE_CHROMIUM_FLAGS=--no-sandbox
export QT_QPA_PLATFORM=xcb
cd ${HERE}/${VERSION}
./popo $@
