#!/bin/sh
     
#   Copyright (C) 2016 Deepin, Inc.
#
#   Author:     Li LongYu <lilongyu@linuxdeepin.com>
#               Peng Hao <penghao@linuxdeepin.com>
     
#               Vufa <countstarlight@gmail.com>

BOTTLENAME="Deepin-@appname@"
APPVER=@appver@
WINEPREFIX="${HOME}/.deepinwine/${BOTTLENAME}"
EXEC_PATH="c:/Program Files/CNTV/@appname@/bin/@appname@.exe"
EXEC_FILE="${WINEPREFIX}/drive_c/Program Files/CNTV/@appname@/bin/@appname@.exe"
START_SHELL_PATH="/opt/deepinwine/tools/run_v4.sh"
export MIME_TYPE=""
export DEB_PACKAGE_NAME=@pkgname@
export APPRUN_CMD="deepin-wine6-stable"
DISABLE_ATTACH_FILE_DIALOG=""
EXPORT_ENVS=""
SPECIFY_SHELL_DIR=$(dirname ${START_SHELL_PATH})
export SPECIFY_SHELL_DIR     
ARCHIVE_FILE_DIR="/opt/apps/${DEB_PACKAGE_NAME}/files"     
export WINEDLLPATH="/opt/${APPRUN_CMD}/lib:/opt/${APPRUN_CMD}/lib64"
export LD_LIBRARY_PATH="/opt/apps/${DEB_PACKAGE_NAME}/files/lib32"
export WINEPREDLL="${ARCHIVE_FILE_DIR}/dlls"

msg() {
    ECHO_LEVEL=("\033[1;32m==> " "\033[1;31m==> ERROR: ")
    echo -e "${ECHO_LEVEL[$1]}\033[1;37m$2\033[0m"
}

if [ -z "${DISABLE_ATTACH_FILE_DIALOG}" ];then
    export ATTACH_FILE_DIALOG=1
fi

if [ -n "${EXEC_PATH}" ];then
    "${START_SHELL_PATH}" "${BOTTLENAME}" "${APPVER}" "${EXEC_PATH}" "$@"
else
    "${START_SHELL_PATH}" "${BOTTLENAME}" "${APPVER}" "uninstaller.exe" "$@"
fi