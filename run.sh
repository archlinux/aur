#!/bin/sh
 
#   Copyright (C) 2020 Deepin, Inc.
#
#   Author:     RTX3090 <QQ482961502@gmail.com>
 
BOTTLENAME="Deepin-danmoshui"
APPVER="0.0.6"
EXEC_PATH="c:/Program Files/danmoshui/danmoshui.exe"
START_SHELL_PATH="/opt/deepinwine/tools/run_v4.sh"
 
export MIME_TYPE=""
export DEB_PACKAGE_NAME="deepin-wine-danmoshui"
export APPRUN_CMD="deepin-wine6-stable"
 
if [ -n "$EXEC_PATH" ];then
        $START_SHELL_PATH $BOTTLENAME $APPVER "$EXEC_PATH" "$@"
    else
        $START_SHELL_PATH $BOTTLENAME $APPVER "uninstaller.exe" "$@"
fi