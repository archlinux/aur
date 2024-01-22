#!/bin/sh
BOTTLENAME=Deepin-@bottlename@
APPVER=@appver@
EXEC_PATH="c:/Program Files (x86)/Netease/@dirname@-bin/@runname@.exe"
START_SHELL_PATH="/opt/deepinwine/tools/run_v4.sh"
ARCHIVE_FILE_DIR="/opt/apps/$DEB_PACKAGE_NAME/files"
export MIME_TYPE=""
export DEB_PACKAGE_NAME=@appname@
export WINEPREDLL="$ARCHIVE_FILE_DIR/dlls"
export APPRUN_CMD="deepin-wine6-stable"
if [ -n "${EXEC_PATH}" ];then
    exec "${START_SHELL_PATH}" "${BOTTLENAME}" "${APPVER}" "${EXEC_PATH}" "$@"
else
    exec "${START_SHELL_PATH}" "${BOTTLENAME}" "${APPVER}" "uninstaller.exe" "$@"
fi