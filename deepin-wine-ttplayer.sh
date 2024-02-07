#!/bin/sh
set -e
BOTTLENAME=@bottlename@
APPVER=@pkgver@
EXEC_PATH="c:/Program Files/@runname@/@runname@.exe"
START_SHELL_PATH="/opt/deepinwine/tools/run_v4.sh"
export MIME_TYPE=""
export DEB_PACKAGE_NAME=@pkgname@
export APPRUN_CMD=deepin-wine6-stable
if [ -n "${EXEC_PATH}" ];then
    exec "${START_SHELL_PATH}" "${BOTTLENAME}" "${APPVER}" "${EXEC_PATH}" "$@" || exit $?
else
    exec "${START_SHELL_PATH}" "${BOTTLENAME}" "${APPVER}" "uninstaller.exe" "$@" || exit $?
fi