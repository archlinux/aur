#!/bin/sh
BOTTLENAME=Deepin-MailMaster
APPVER=5.0.5.1010
EXEC_PATH="c:/Program Files (x86)/Netease/MailMaster-bin/mailmaster.exe"
START_SHELL_PATH="/opt/deepinwine/tools/run_v4.sh"
ARCHIVE_FILE_DIR="/opt/apps/$DEB_PACKAGE_NAME/files"

export MIME_TYPE=""
export DEB_PACKAGE_NAME="deepin-wine-mailmaster"
export WINEPREDLL="$ARCHIVE_FILE_DIR/dlls"
export APPRUN_CMD="deepin-wine6-stable"
 
if [ -n "$EXEC_PATH" ];then
        $START_SHELL_PATH $BOTTLENAME $APPVER "$EXEC_PATH" "$@"
    else
        $START_SHELL_PATH $BOTTLENAME $APPVER "uninstaller.exe" "$@"
fi