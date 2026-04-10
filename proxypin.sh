#!/bin/bash
set -o pipefail

_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/@runname@"

export PATH="${_APPDIR}/lib:${PATH}"

cd "${_APPDIR}" || exit 1

# 🔥 KDE6 兼容（最稳）
if ! command -v kwriteconfig5 >/dev/null 2>&1 && command -v kwriteconfig6 >/dev/null 2>&1; then
    fakebin="$(mktemp -d)"
    ln -sf /usr/bin/kwriteconfig6 "$fakebin/kwriteconfig5"
    export PATH="$fakebin:$PATH"
fi

exec "${_RUNNAME}" "$@"
