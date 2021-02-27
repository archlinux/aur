#!/bin/sh

#   Copyright (C) 2016 Deepin, Inc.
#
#   Author:     Li LongYu <lilongyu@linuxdeepin.com>
#               Peng Hao <penghao@linuxdeepin.com>

#               Codist <countstarlight@gmail.com>
#               Lapis Apple <laple@pd2.ink>

version_gt() { test "$(echo "$@" | tr " " "\n" | sort -V | head -n 1)" != "$1"; }

extract_archive()
{
    archive=$1
    version_file=$2
    dest_dir=$3
    if [ -f "$archive" ] && [ -n "$dest_dir" ] && [ "$dest_dir" != "." ];then
        archive_version=`cat $version_file`
        if [ -d "$dest_dir" ];then
            if [ -f "$dest_dir/VERSION" ];then
                dest_version=`cat $dest_dir/VERSION`
                if version_gt "$archive_version" "$dest_version" || [ -z "$dest_version" ];then
                    7z x "$archive" -o/"$dest_dir" -aoa
                    echo "$archive_version" > "$dest_dir/VERSION"
                fi
            fi
        else
            mkdir -p $dest_dir
            7z x "$archive" -o/"$dest_dir" -aoa
            echo "$archive_version" > "$dest_dir/VERSION"
        fi
    fi
}

BOTTLENAME="Deepin-QQMusic"
APPVER="17.73deepin10"
WINEPREFIX="$HOME/.deepinwine/$BOTTLENAME"
#QQ_VER="9.4.3.27712"
EXEC_PATH="c:/Program Files/Tencent/QQMusic/QQMusic.exe"
START_SHELL_PATH="$HOME/.deepinwine/deepin-wine-helper/run_v3.sh"
#QQ_INSTALLER="PCQQ2021"
#QQ_INSTALLER_PATH="c:/Program Files/Tencent/$QQ_INSTALLER-$QQ_VER.exe"
export MIME_TYPE=""
export DEB_PACKAGE_NAME="com.qq.music.deepin"
#export APPRUN_CMD="wine"
export PATCH_LOADER_ENV=""
export FILEDLG_PLUGIN="/opt/apps/$DEB_PACKAGE_NAME/files/gtkGetFileNameDlg"

export SPECIFY_SHELL_DIR=`dirname $START_SHELL_PATH`

ARCHIVE_FILE_DIR="/opt/apps/$DEB_PACKAGE_NAME/files"

msg()
{
	ECHO_LEVEL=("\033[1;32m==> " "\033[1;31m==> ERROR: ")
	echo -e "${ECHO_LEVEL[$1]}\033[1;37m$2\033[0m"
}

SwitchToOriginalWine()
{
    PACKAGE_MANAGER="yay"
    ORIGINAL_WINE_DEPENDS="wine wine-mono wine-gecko xorg-xwininfo lib32-alsa-lib lib32-alsa-plugins lib32-libpulse lib32-openal lib32-mpg123 lib32-gnutls"
    msg 0 "Checking dependency.."
    if ! [ -x "$(command -v yay)" ]; then
        if ! [ -x "$(command -v pacman)" ]; then
            msg 1 "Sorry, but.. is this really archlinux???" >&2
            exit 1
        else
            $PACKAGE_MANAGER="pacman"
        fi
    fi
    for p in ${ORIGINAL_WINE_DEPENDS}; do
        if pacman -Qs $p > /dev/null ; then
            msg 0 "$p is installed, skip ..."
        else
            msg 0 "Installing dependency: $p ..."
            $PACKAGE_MANAGER -S $p
        fi
    done
    msg 0 "Redeploying app ..."
    extract_archive "$ARCHIVE_FILE_DIR/helper_archive.7z" "$ARCHIVE_FILE_DIR/helper_archive.md5sum" "$SPECIFY_SHELL_DIR"
    $START_SHELL_PATH $BOTTLENAME $APPVER "$EXEC_PATH" -r
    #msg 0 "Reversing the patch ..."
    #patch -p1 -R -d  ${WINEPREFIX} < $ARCHIVE_FILE_DIR/reg.patch
    echo "5" > $WINEPREFIX/originalwine
    rm -f $WINEPREFIX/reinstalled
    msg 0 "Done."
    exit 0
}

OpenWinecfg()
{
    if [ -f "$WINEPREFIX/originalwine" ]; then
        env WINEPREFIX=$WINEPREFIX winecfg
    else
        env WINEPREFIX=$WINEPREFIX deepin-wine5 winecfg
    fi
}

Run()
{
    extract_archive "$ARCHIVE_FILE_DIR/helper_archive.7z" "$ARCHIVE_FILE_DIR/helper_archive.md5sum" "$SPECIFY_SHELL_DIR"

    if [ -n "$PATCH_LOADER_ENV" ] && [ -n "$EXEC_PATH" ];then
        export $PATCH_LOADER_ENV
    fi

    if [ -n "$EXEC_PATH" ];then
#        if [ ! -f "$WINEPREFIX/reinstalled" ];then
#            touch $WINEPREFIX/reinstalled
#            env LC_ALL=zh_CN.UTF-8 WINEDLLOVERRIDES="winemenubuilder.exe=d" $START_SHELL_PATH $BOTTLENAME $APPVER "$QQ_INSTALLER_PATH" "$@"
#        else
    env LC_ALL=zh_CN.UTF-8 $START_SHELL_PATH $BOTTLENAME $APPVER "$EXEC_PATH" "$@"
#        fi
    else
        env LC_ALL=zh_CN.UTF-8 $START_SHELL_PATH $BOTTLENAME $APPVER "uninstaller.exe" "$@"
    fi
}

HelpApp()
{
	echo " Extra Commands:"
	echo " winecfg        Open winecfg"
	echo " -o/--original  Switch to original wine"
	echo " -h/--help      Show program help info"
}

if [ -f "$WINEPREFIX/originalwine" ]; then
        export APPRUN_CMD="wine"
else
    export APPRUN_CMD="deepin-wine5"
fi

if [ -z $1 ]; then
	Run "$@"
	exit 0
fi
case $1 in
	"winecfg")
		OpenWinecfg
		;;
	"-o" | "--originalwine")
		SwitchToOriginalWine
		;;
	"-h" | "--help")
		HelpApp
		;;
	*)
		Run "$@"
		;;
esac
exit 0
