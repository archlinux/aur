#!/bin/sh

#   Copyright (C) 2016 Deepin, Inc.
#
#   Author:     Li LongYu <lilongyu@linuxdeepin.com>
#               Peng Hao <penghao@linuxdeepin.com>

#               Vufa <countstarlight@gmail.com>

version_gt() { test "$(echo "$@" | tr " " "\n" | sort -V | head -n 1)" != "$1"; }

BOTTLENAME="Deepin-TIM"
APPVER="9.3.2deepin20"
WINEPREFIX="$HOME/.deepinwine/$BOTTLENAME"
TIM_FONTS="$WINEPREFIX/drive_c/windows/Fonts"
TIM_VER="3.4.7.22084"
EXEC_PATH="c:/Program Files/Tencent/TIM/Bin/TIM.exe"
EXEC_FILE="$WINEPREFIX/drive_c/Program Files/Tencent/TIM/Bin/TIM.exe"
START_SHELL_PATH="/opt/deepinwine/tools/run_v4.sh"
TIM_INSTALLER_PATH="c:/Program Files/Tencent/TIM$TIM_VER.exe"
export MIME_TYPE=""
export DEB_PACKAGE_NAME="com.qq.office.deepin"
export APPRUN_CMD="deepin-wine5"
DISABLE_ATTACH_FILE_DIALOG=""

export SPECIFY_SHELL_DIR=`dirname $START_SHELL_PATH`

ARCHIVE_FILE_DIR="/opt/apps/$DEB_PACKAGE_NAME/files"

export WINEDLLPATH=/opt/$APPRUN_CMD/lib:/opt/$APPRUN_CMD/lib64

OpenWinecfg()
{
    env WINEPREFIX=$WINEPREFIX $APPRUN_CMD winecfg
}

DeployApp()
{
    # backup fonts
    if [ -d "$TIM_FONTS" ];then
        mkdir -p $HOME/.deepinwine/.tim_tmp
        cp $TIM_FONTS/* $HOME/.deepinwine/.tim_tmp/
    fi

    # re-deploy bottle
    rm -rf "$WINEPREFIX"
    # run installer
    env LC_ALL=zh_CN.UTF-8 WINEDLLOVERRIDES="winemenubuilder.exe=d" $START_SHELL_PATH $BOTTLENAME $APPVER "$TIM_INSTALLER_PATH" "$@"

    # restore fonts
    if [ -d "$HOME/.deepinwine/.tim_tmp" ];then
        cp -n $HOME/.deepinwine/.tim_tmp/* $TIM_FONTS/
        rm -rf "$HOME/.deepinwine/.tim_tmp"
    fi
    touch $WINEPREFIX/reinstalled
    cat /opt/apps/$DEB_PACKAGE_NAME/files/files.md5sum > $WINEPREFIX/PACKAGE_VERSION
}

Run()
{
    if [ -z "$DISABLE_ATTACH_FILE_DIALOG" ];then
        export ATTACH_FILE_DIALOG=1
    fi

    if [ -n "$EXEC_PATH" ];then
        if [ ! -f "$WINEPREFIX/reinstalled" ];then
            DeployApp
        else
            # missing exec file
            if [ ! -f "$EXEC_FILE" ];then
                DeployApp
            fi

            env LC_ALL=zh_CN.UTF-8 $START_SHELL_PATH $BOTTLENAME $APPVER "$EXEC_PATH" "$@"
        fi
    else
        env LC_ALL=zh_CN.UTF-8 $START_SHELL_PATH $BOTTLENAME $APPVER "uninstaller.exe" "$@"
    fi
}

HelpApp()
{
	echo " Extra Commands:"
	echo " winecfg        Open winecfg"
	echo " -h/--help      Show program help info"
}

if [ -z $1 ]; then
	Run "$@"
	exit 0
fi
case $1 in
	"winecfg")
		OpenWinecfg
		;;
	"-h" | "--help")
		HelpApp
		;;
	*)
		Run "$@"
		;;
esac
exit 0
