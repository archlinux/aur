#!/bin/sh
BOTTLENAME=Deepin-@bottlename@
APPVER=@appver@
EXEC_PATH="c:/Program Files/Yuque/yuque-desktop/语雀.exe"
START_SHELL_PATH="/opt/deepinwine/tools/spark_run_v4.sh"
export MIME_TYPE=""
export DEB_PACKAGE_NAME=@pkgname@
export APPRUN_CMD="deepin-wine6-stable"
EXPORT_ENVS=""
export SPECIFY_SHELL_DIR=`dirname $START_SHELL_PATH`
ARCHIVE_FILE_DIR="/opt/apps/${DEB_PACKAGE_NAME}/files"
export WINEDLLPATH="/opt/${APPRUN_CMD}/lib:/opt/${APPRUN_CMD}/lib64"
export WINEPREDLL="${ARCHIVE_FILE_DIR}/dlls"
DISABLE_ATTACH_FILE_DIALOG=""
if [ -z "${DISABLE_ATTACH_FILE_DIALOG}" ];then
    export ATTACH_FILE_DIALOG=1
fi
if [ -n "${EXPORT_ENVS}" ];then
    export "${EXPORT_ENVS}"
fi
if [ -n "${EXEC_PATH}" ];then
    if [ -z "${EXEC_PATH##*.lnk*}" ];then
        exec "${START_SHELL_PATH}" "${BOTTLENAME}" "${APPVER}" "C:/windows/command/start.exe" "/Unix" "${EXEC_PATH}" "$@" || exit $?
    else
        exec "${START_SHELL_PATH}" "${BOTTLENAME}" "${APPVER}" "${EXEC_PATH}" "$@" || exit $?
    fi
else
    exec "${START_SHELL_PATH}" "${BOTTLENAME}" "${APPVER}" "uninstaller.exe" "$@" || exit $?
fi