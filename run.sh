#!/bin/sh

#   Copyright (C) 2016 Deepin, Inc.
#
#   Author:     Li LongYu <lilongyu@linuxdeepin.com>
#               Peng Hao <penghao@linuxdeepin.com>

WINEPREFIX="$HOME/.deepinwine/Deepin-WXWork"
# BOTTLENAME="Deepin-WXWork"
APPDIR="/opt/deepinwine/apps/Deepin-WXWork"
APPVER="2.8.10.2010deepin0"
WXWORK_INSTALLER="WXWork"
WXWORK_VER="3.0.7.1708"
APPTAR="files.7z"
PACKAGENAME="com.wxwork"
WINE_CMD="wine"
# EXEC_PATH="c:/Program Files/WXWork/WXWork.exe"

# if [ -n "$EXEC_PATH" ];then
#     /opt/deepinwine/tools/run_v2.sh $BOTTLENAME $APPVER "$EXEC_PATH" "$@"
# else
#     /opt/deepinwine/tools/run_v2.sh $BOTTLENAME $APPVER "uninstaller.exe" "$@"
# fi

# ###################################################################################

#   Maintainer: St.kai <St.kai@live.com>
CallApp()
{
	printf "call deepin-wine......\n"
	if [ ! -f "$WINEPREFIX/reinstalled" ]
	then
		touch $WINEPREFIX/reinstalled
		printf "reinstalled\n"
		env WINEDLLOVERRIDES="winemenubuilder.exe=d" WINEPREFIX="$WINEPREFIX" $WINE_CMD $APPDIR/$WXWORK_INSTALLER-$WXWORK_VER.exe
	else
        #Support use native file dialogWXWORK
        export ATTACH_FILE_DIALOG=1
		printf "Run Deepin-Wine-WXWork\n"
        env WINEPREFIX="$WINEPREFIX" WINEDEBUG=-msvcrt $WINE_CMD "c:\\Program Files\\WXWork\\WXWork.exe" &
	fi
}
ExtractApp()
{
	printf "Extract......\n"
	mkdir -p "$1"
	7z x "$APPDIR/$APPTAR" -o"$1"
	mv "$1/drive_c/users/@current_user@" "$1/drive_c/users/$USER"
	printf "patch reg\n"
	sed -i "s#@current_user@#$USER#" $1/*.reg
}
DeployApp()
{
	printf "Deploy WXWork\n"
	ExtractApp "$WINEPREFIX"
	echo "$APPVER" > "$WINEPREFIX/PACKAGE_VERSION"
}
UpdateApp()
{
	printf "Update WXWork\n"
	if [ -f "$WINEPREFIX/PACKAGE_VERSION" ] && [ "$(cat "$WINEPREFIX/PACKAGE_VERSION")" = "$APPVER" ]; then
		return
	fi
	if [ -d "${WINEPREFIX}.tmpdir" ]; then
		rm -rf "${WINEPREFIX}.tmpdir"
	fi
	ExtractApp "${WINEPREFIX}.tmpdir"
	/opt/deepinwine/tools/updater -s "${WINEPREFIX}.tmpdir" -c "${WINEPREFIX}" -v
	rm -rf "${WINEPREFIX}.tmpdir"
	echo "$APPVER" > "$WINEPREFIX/PACKAGE_VERSION"
}
RunApp()
{
	printf "Run WXWork\n"

 	if [ -d "$WINEPREFIX" ]; then
 		UpdateApp
 	else
 		DeployApp
 	fi
 	CallApp
}
CreateBottle()
{
	printf "Create Wine Bottle\n"
    if [ -d "$WINEPREFIX" ]; then
        UpdateApp
    else
        DeployApp
    fi
}
# Init
printf "Init ......\n"
if [ -f "$WINEPREFIX/deepin" ]; then
	WINE_CMD="deepin-wine"
	printf "WINEPREFIX ---> deepin-wine\n"
	if [[ -z "$(ps -e | grep -o gsd-xsettings)" ]]; then
		/usr/lib/gsd-xsettings &
		printf "/usr/lib/gsd-xsettings\n"
	fi
fi

if [ -z $1 ]; then
	RunApp
	exit 0
fi
case $1 in
	"-c" | "--create")
		CreateBottle
		;;
	"-u" | "--uri")
		RunApp $2
		;;
	*)
		echo "Invalid option: $1"
		echo "Use -h|--help to get help"
		exit 1
		;;
esac
exit 0