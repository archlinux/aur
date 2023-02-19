#!/bin/sh
BOTTLENAME="Deepin-MailMaster"
APPVER="4.18.1.1007"
EXEC_PATH="c:/Program Files (x86)/Netease/MailMaster-bin/mailmaster.exe"
START_SHELL_PATH="/opt/deepinwine/tools/run_v4.sh"
 
export MIME_TYPE=""
export DEB_PACKAGE_NAME="deepin-wine-mailmaster"
export APPRUN_CMD="deepin-wine6-stable"
 
if [ -n "$EXEC_PATH" ];then
        $START_SHELL_PATH $BOTTLENAME $APPVER "$EXEC_PATH" "$@"
    else
        $START_SHELL_PATH $BOTTLENAME $APPVER "uninstaller.exe" "$@"
fi