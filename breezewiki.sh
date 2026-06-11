#!/bin/sh
[ -d "${HOME}/.cache/breezewiki" ] || mkdir -p "${HOME}/.cache/breezewiki"
cd "${HOME}/.cache/breezewiki"
echo "CWD=$(pwd)"
exec /opt/breezewiki-bin/bin/dist
