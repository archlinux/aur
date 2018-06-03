WINEPREFIX="$HOME/.deepinwine/Deepin-WXWork"
APPDIR="/opt/deepinwine/apps/Deepin-WXWork"
APPVER="2.4.16.1347deepin0-1"
APPTAR="files.7z"
PACKAGENAME="deepin.com.wxwork"

if [ ! -d "$WINEPREFIX" ]; then
    mkdir -p $WINEPREFIX
    7z x "$APPDIR/$APPTAR" -o"$WINEPREFIX"
    mv "$WINEPREFIX/drive_c/users/"{@current_user@,$USER}
    sed -i "s#@current_user@#$USER#" $WINEPREFIX/*.reg
fi

export WINEPREFIX
LANG=zh_CN.UTF-8 wine "$WINEPREFIX/drive_c/Program Files/WXWork/WXWork.exe"
