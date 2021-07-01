#!/bin/bash

#   Copyright (C) 2016 Deepin, Inc.
#
#   Author:     Li LongYu <lilongyu@linuxdeepin.com>
#               Peng Hao <penghao@linuxdeepin.com>
#               zty199 <zty2864@gmail.com>

BOTTLENAME="Deepin-plantsvszombies"
APPVER="1.13deepin0"
EXEC_PATH="c:/Program Files/plantsvszombies/PlantsVsZombies.exe"

START_SHELL_PATH="/opt/deepinwine/tools/run_v3.sh"
export MIME_TYPE=""
export DEB_PACKAGE_NAME="com.pvz.spark"
export APPRUN_CMD="deepin-wine5"
export PATCH_LOADER_ENV=""
export FILEDLG_PLUGIN="/opt/apps/$DEB_PACKAGE_NAME/files/gtkGetFileNameDlg"

ARCHIVE_FILE_DIR="/opt/apps/$DEB_PACKAGE_NAME/files"
export WINEPREDLL="$ARCHIVE_FILE_DIR/dlls"

if [ -n "$EXEC_PATH" ];then
    $START_SHELL_PATH $BOTTLENAME $APPVER "$EXEC_PATH" "$@"
else
    $START_SHELL_PATH $BOTTLENAME $APPVER "uninstaller.exe" "$@"
fi
