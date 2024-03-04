#!/bin/bash
set -e
BOTTLENAME=Deepin-@bottlename@
APPVER=@appver@
EXEC_PATH="c:/Program Files/@bottlename@/@bottlename@.exe"
START_SHELL_PATH="/opt/deepinwine/tools/run_v4.sh"
export MIME_TYPE=""
export DEB_PACKAGE_NAME=@appname@
export APPRUN_CMD="deepin-wine6-stable"
if [ -n "${EXEC_PATH}" ];then
    exec "${START_SHELL_PATH}" "${BOTTLENAME}" "${APPVER}" "${EXEC_PATH}" "$@" || exit $?
    else
    exec "${START_SHELL_PATH}" "${BOTTLENAME}" "${APPVER}" "uninstaller.exe" "$@" || exit $?
fi