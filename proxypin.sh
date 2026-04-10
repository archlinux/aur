#!/bin/bash
set -o pipefail

_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/@runname@"

export PATH="${_APPDIR}/lib:${PATH}"

cd "${_APPDIR}" || exit 1

# 🔥 KDE6 兼容（最稳）
if ! command -v kwriteconfig5 >/dev/null 2>&1 && command -v kwriteconfig6 >/dev/null 2>&1; then
    mkdir -p /tmp/proxypin-bin-fakebin
    ln -sf /usr/bin/kwriteconfig6 /tmp/proxypin-bin-fakebin/kwriteconfig5
    export PATH="/tmp/proxypin-bin-fakebin:$PATH"
fi

exec "${_RUNNAME}" "$@"
