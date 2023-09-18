#!/bin/sh
   
#   Copyright (C) 2016 Deepin, Inc.
#
#   Author:     Li LongYu <lilongyu@linuxdeepin.com>
#               Peng Hao <penghao@linuxdeepin.com>
 
version_gt() { test "$(echo "$@" | tr " " "\n" | sort -V | head -n 1)" != "$1"; }
BOTTLENAME=Deepin-QuarkCloudDrive
APPVER=2.5.39spark2
WINEPREFIX="${HOME}/.deepinwine/${BOTTLENAME}"
APP_INSTALLER="quark-cloud-drive-2.5.46.exe"
APP_INSTALLER_PATH="c:/Program Files (x86)/quark-cloud-drive/${APP_INSTALLER}"
EXEC_PATH="c:/Program Files (x86)/quark-cloud-drive/QuarkCloudDrive.exe"
EXEC_FILE="${WINEPREFIX}/drive_c/Program Files (x86)/quark-cloud-drive/QuarkCloudDrive.exe"
START_SHELL_PATH="/opt/deepinwine/tools/run_v4.sh"
export MIME_TYPE=""
export DEB_PACKAGE_NAME="deepin-wine-quarkclouddrive"
export APPRUN_CMD="deepin-wine6-stable"
DISABLE_ATTACH_FILE_DIALOG="1"
export SPECIFY_SHELL_DIR=`dirname ${START_SHELL_PATH}`
ARCHIVE_FILE_DIR="/opt/apps/${DEB_PACKAGE_NAME}/files"
export WINEPREDLL="${ARCHIVE_FILE_DIR}/dlls"

OpenWinecfg() {
    echo "Launching winecfg with ${APPRUN_CMD} in ${WINEPREFIX} ..."
    env WINEPREFIX="${WINEPREFIX}" "${APPRUN_CMD}" winecfg
}

DeployApp() {
    # deploy bottle
    echo "Deploying ${WINEPREFIX} ..."
    rm -rf "${WINEPREFIX}"
    # run installer
    echo "Launching ${APP_INSTALLER_PATH} ..."
    env WINEDLLOVERRIDES="winemenubuilder.exe=d" "${START_SHELL_PATH}" "${BOTTLENAME}" "${APPVER}" "${APP_INSTALLER_PATH}" "$@"
    touch "${WINEPREFIX}/reinstalled"
    echo "Creating ${WINEPREFIX}/PACKAGE_VERSION ..."
    cat "/opt/apps/${DEB_PACKAGE_NAME}/files/files.md5sum" > "${WINEPREFIX}/PACKAGE_VERSION"
}

WakeApp() {
    env WINEPREDLL="${ARCHIVE_FILE_DIR}/dlls" \
        WINEDLLPATH="/opt/${APPRUN_CMD}/lib:/opt/${APPRUN_CMD}/lib64" \
        WINEPREFIX="${WINEPREFIX} ${APPRUN_CMD} /opt/deepinwine/tools/sendkeys.exe w"
}

Run() {
    if [ -z "${DISABLE_ATTACH_FILE_DIALOG}" ]; then
        export ATTACH_FILE_DIALOG=1
    fi

    if [ -n "${EXPORT_ENVS}" ]; then
        export "${EXPORT_ENVS}"
    fi

    if [ -n "${EXEC_PATH}" ]; then
        if [ ! -f "${WINEPREFIX}/reinstalled" ] || [ ! -f "${EXEC_FILE}" ]; then
            DeployApp
            exit 0
        fi

        if [ -z "${EXEC_PATH##*.lnk*}" ]; then
            echo "Launching  ${EXEC_PATH} lnk file ..."
            "${START_SHELL_PATH}" "${BOTTLENAME}" "${APPVER}" "C:/windows/command/start.exe" "/Unix" "${EXEC_PATH}" "$@"
        else
            echo "Launching  $EXEC_PATH ..."
            "${START_SHELL_PATH}" "${BOTTLENAME}" "${APPVER}" "${EXEC_PATH}" "$@"
        fi
    else
        "${START_SHELL_PATH}" "${BOTTLENAME}" "${APPVER}" "uninstaller.exe" "$@"
    fi
}

HelpApp() {
    echo " Extra Commands:"
    echo " winecfg          Open winecfg"
    echo " -w/--wake        Wake up background program"
    echo " -h/--help        Show program help info"
}

if [ -z $1 ]; then
    Run "$@"
    exit 0
fi
case $1 in
"winecfg")
    OpenWinecfg
    ;;
"-w" | "--wake")
    WakeApp
    ;;
"-h" | "--help")
    HelpApp
    ;;
*)
    Run "$@"
    ;;
esac
exit 0