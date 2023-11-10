#!/bin/sh

#   Copyright (C) 2016 Deepin, Inc.
#
#   Author:     Li LongYu <lilongyu@linuxdeepin.com>
#               Peng Hao <penghao@linuxdeepin.com>
version_gt() { test "$(echo "$@" | tr " " "\n" | sort -V | head -n 1)" != "$1"; }
BOTTLENAME=Deepin-eCloud
APPVER=6.6.0
EXEC_PATH="c:/Program Files/ecloud/eCloud.exe"
START_SHELL_PATH="/opt/deepinwine/tools/spark_run_v4.sh"
#START_SHELL_PATH="/opt/deepinwine/tools/run_v4.sh"
export MIME_TYPE=""
export DEB_PACKAGE_NAME="deepin-wine-ecloud"
export APPRUN_CMD="deepin-wine6-stable"
DISABLE_ATTACH_FILE_DIALOG="1"
export SPECIFY_SHELL_DIR=`dirname ${START_SHELL_PATH}`
ARCHIVE_FILE_DIR="/opt/apps/${DEB_PACKAGE_NAME}/files"
export WINEPREDLL="${ARCHIVE_FILE_DIR}/dlls"
if [ -z "${DISABLE_ATTACH_FILE_DIALOG}" ];then
    export ATTACH_FILE_DIALOG=1
fi

if [ -n "$EXEC_PATH" ];then
    "${START_SHELL_PATH}" "${BOTTLENAME}" "${APPVER}" "${EXEC_PATH}" "$@"
else
    "${START_SHELL_PATH}" "${BOTTLENAME}" "${APPVER}" "uninstaller.exe" "$@"
fi