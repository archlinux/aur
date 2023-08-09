#!/bin/bash

#   Copyright (C) 2016 Deepin, Inc.
#
#   Author:     Li LongYu <lilongyu@linuxdeepin.com>
#               Peng Hao <penghao@linuxdeepin.com>

version_gt() { test "$(echo "$@" | tr " " "\n" | sort -V | head -n 1)" != "$1"; }

ACTIVEX_NAME=""
BOTTLENAME="Deepin-WXWork"
APPVER="4.1.6.6017deepin5"
EXEC_PATH="c:/Program Files/WXWork/WXWork.exe"
START_SHELL_PATH="/opt/deepinwine/tools/spark_run_v4.sh"
export MIME_TYPE=""
export MIME_EXEC=""
export DEB_PACKAGE_NAME="com.qq.weixin.work.deepin"
export APPRUN_CMD="deepin-wine6-stable"

export LD_LIBRARY_PATH=/opt/apps/com.qq.weixin.work.deepin/lib/

DISABLE_ATTACH_FILE_DIALOG=""
EXPORT_ENVS=""
EXEC_NAME="WXWork.exe"
INSTALL_SETUP=""
export BOX86_EMU_CMD="/opt/deepin-box86/stable/box86"
export DEF_EMU_NAME="exagear"
export SPECIFY_SHELL_DIR=${START_SHELL_PATH%/*}
export WINESERVICESNODELAY=""
export WINESERVICESDISABLE="nsiproxy"

ARCHIVE_FILE_DIR="/opt/apps/$DEB_PACKAGE_NAME/files"

if [ -z "$APPRUN_CMD" ];then
    export APPRUN_CMD="/opt/deepin-wine6-stable/bin/wine"
fi
if [ -f "$APPRUN_CMD" ];then
    wine_path=$(dirname $APPRUN_CMD)
    wine_path=$(realpath "$wine_path/../")
    export WINEDLLPATH=$wine_path/lib:$wine_path/lib64
else
    export WINEDLLPATH=/opt/$APPRUN_CMD/lib:/opt/$APPRUN_CMD/lib64
fi

export WINEPREDLL="$ARCHIVE_FILE_DIR/dlls"

_SetRegistryValue()
{
    env WINEPREFIX="$BOTTLEPATH" $APPRUN_CMD reg ADD "$1" /v "$2" /t "$3" /d "$4" /f
}

if [ -z "$DISABLE_ATTACH_FILE_DIALOG" ];then
    export ATTACH_FILE_DIALOG=1
fi

if [ -n "$EXPORT_ENVS" ];then
    export $EXPORT_ENVS
fi

# 打包安装程序的情况
if [[ -z "$EXEC_PATH" ]] && [[ -n "$INSTALL_SETUP" ]];then
    $START_SHELL_PATH $BOTTLENAME $APPVER "$EXEC_PATH" -c
    BOTTLEPATH="$HOME/.deepinwine/$BOTTLENAME"
    EXEC_PATH=$(find "$BOTTLEPATH" -name $EXEC_NAME | head -1)
    if [ -z "$EXEC_PATH" ];then
        _SetRegistryValue "HKCU\\Software\\Wine\\DllOverrides" winemenubuilder.exe REG_SZ
        WINEPREFIX="$BOTTLEPATH" $APPRUN_CMD "$ARCHIVE_FILE_DIR/$INSTALL_SETUP"
        EXEC_PATH=$(find "$BOTTLEPATH" -name $EXEC_NAME | head -1)

        cp "$ARCHIVE_FILE_DIR/setup.md5sum" "$BOTTLEPATH"
    fi

    if [ -z "$EXEC_PATH" ];then
        echo "安装失败退出"
        exit
    fi
fi

if [ -n "$EXEC_PATH" ];then
    if [ -z "${EXEC_PATH##*.lnk*}" ];then
        $START_SHELL_PATH $BOTTLENAME $APPVER "C:/windows/command/start.exe" "/Unix" "$EXEC_PATH" "$@"
    elif [ -z "${EXEC_PATH##*.bat}" ];then
        $START_SHELL_PATH $BOTTLENAME $APPVER "cmd" -f /c "$EXEC_PATH" "${@:2}"
    else
        $START_SHELL_PATH $BOTTLENAME $APPVER "$EXEC_PATH" "$@"
    fi
elif [ -n "$ACTIVEX_NAME" ] && [ $# -gt 1 ];then
    $START_SHELL_PATH $BOTTLENAME $APPVER "$1" -f "${@:2}"
else
    $START_SHELL_PATH $BOTTLENAME $APPVER "uninstaller.exe" "$@"
fi
