#!/bin/sh

#   Copyright (C) 2020 Deepin, Inc.
#
#   Author:     RTX3090 <QQ482961502@gmail.com>
BOTTLENAME="Deepin-TTPlayer"
APPVER="5.7.9"
EXEC_PATH="c:/Program Files/TTPlayer/TTPlayer.exe"
START_SHELL_PATH="/opt/deepinwine/tools/run_v4.sh"

export MIME_TYPE=""
export DEB_PACKAGE_NAME="deepin-wine-ttplayer"
export APPRUN_CMD="deepin-wine6-stable"

if [ -n "$EXEC_PATH" ];then
        $START_SHELL_PATH $BOTTLENAME $APPVER "$EXEC_PATH" "$@"
    else
        $START_SHELL_PATH $BOTTLENAME $APPVER "uninstaller.exe" "$@"
fi