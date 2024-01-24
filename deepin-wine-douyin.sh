#!/bin/sh
set -e
version_gt() {
    test "$(echo "$@" | tr " " "\n" | sort -V | head -n 1)" != "$1";
}
BOTTLENAME=@bottlename@
APPVER=@appver@
WINEPREFIX="${HOME}/.deepinwine/${BOTTLENAME}"
EXEC_PATH="c:/Program Files/@pathname@/@appname@/@appname@.exe"
START_SHELL_PATH="/opt/deepinwine/tools/run_v4.sh"
export MIME_TYPE=""
export DEB_PACKAGE_NAME=@packagename@
export APPRUN_CMD="deepin-wine6-stable"
DISABLE_ATTACH_FILE_DIALOG="1"
export SPECIFY_SHELL_DIR=`dirname ${START_SHELL_PATH}`
ARCHIVE_FILE_DIR="/opt/apps/${DEB_PACKAGE_NAME}/files"
export WINEPREDLL="${ARCHIVE_FILE_DIR}/dlls"

if [ -z "${DISABLE_ATTACH_FILE_DIALOG}" ];then
    export ATTACH_FILE_DIALOG=1
fi
   
if [ -n "${EXEC_PATH}" ];then
    exec "${START_SHELL_PATH}" "${BOTTLENAME}" "${APPVER}" "${EXEC_PATH}" "$@" || exit $?
else
    exec "${START_SHELL_PATH}" "${BOTTLENAME}" "${APPVER}" "uninstaller.exe" "$@" || exit $?
fi