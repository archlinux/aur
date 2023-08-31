#!/bin/sh
BOTTLENAME=Deepin-PandaOCR.Pro
APPVER=5.49
EXEC_PATH="c:/Program Files/PandaOCR.Pro/PandaOCR.Pro.exe"
START_SHELL_PATH="/opt/deepinwine/tools/run_v4.sh"
  
export MIME_TYPE=""
export DEB_PACKAGE_NAME="deepin-wine-pandaocr.pro"
export APPRUN_CMD="deepin-wine6-stable"
  
if [ -n "$EXEC_PATH" ];then
        $START_SHELL_PATH $BOTTLENAME $APPVER "$EXEC_PATH" "$@"
    else
        $START_SHELL_PATH $BOTTLENAME $APPVER "uninstaller.exe" "$@"
fi