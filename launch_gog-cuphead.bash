#!/usr/bin/env bash
set -eu

PKGNAME='gog-cuphead'
APPNAME_UPSTREAM='Cuphead'
EXE="C:/GOG Games/${APPNAME_UPSTREAM}/Cuphead.exe"

echo >&2 "Initializing"

export WINEARCH='win64'
export WINEPREFIX=~/".local/share/${PKGNAME}/wine"

APPDIR_SOURCE="/opt/${PKGNAME}"
APPDIR_PARENT="${WINEPREFIX}/drive_c/GOG Games"

USER_APPDATADIR_SOURCE=~/".config/${PKGNAME}/userappdata"
USER_APPDATADIR_TARGET="${WINEPREFIX}/drive_c/users/$(whoami)`
  `/Application Data"
USER_LOGDIR=~/".local/share/${PKGNAME}/log"

USER_LOGFILE_STDOUT="${USER_LOGDIR}/${PKGNAME}_out.log"
USER_LOGFILE_STDERR="${USER_LOGDIR}/${PKGNAME}_err.log"

mkdir -p "${USER_LOGDIR}"
: > "${USER_LOGFILE_STDOUT}"
: > "${USER_LOGFILE_STDERR}"

echo >&2 "Logging stdout to: ${USER_LOGFILE_STDOUT}"
echo >&2 "Logging stderr to: ${USER_LOGFILE_STDERR}"
echo >&2 "Checking for Wine prefix"

if ! [ -d "${WINEPREFIX}" ]; then
  echo >&2 "==> Bootstrapping Wine prefix"
  (
    mkdir -pv "${WINEPREFIX}"
    wineboot -i
    rm -fv "${WINEPREFIX}/dosdevices/z:"
  ) >> "${USER_LOGFILE_STDOUT}" 2>> "${USER_LOGFILE_STDERR}"
  echo >&2 "==> Done"
fi

mkdir -p "${USER_APPDATADIR_SOURCE}/${APPNAME_UPSTREAM}"

echo >&2 "Checking user data directory"

if ! [ -h "${USER_APPDATADIR_TARGET}/${APPNAME_UPSTREAM}" ]; then
  echo >&2 "==> Creating symlink to user data directory"
  (
    mkdir -pv "${USER_APPDATADIR_TARGET}"
    cd "${USER_APPDATADIR_TARGET}"
    ln -fnsv ../../../../../../../..`
      `/".config/${PKGNAME}/userappdata/${APPNAME_UPSTREAM}"
  ) >> "${USER_LOGFILE_STDOUT}" 2>> "${USER_LOGFILE_STDERR}"
  echo >&2 "==> Done"
fi

echo >&2 "Checking app directory"

if ! [ -d "${APPDIR_PARENT}/${APPNAME_UPSTREAM}" ]; then
  echo >&2 "==> Creating symlink to app directory"
  (
    mkdir -pv "${APPDIR_PARENT}"
    ln -fnsv "${APPDIR_SOURCE}" \
      "${APPDIR_PARENT}/${APPNAME_UPSTREAM}"
  ) >> "${USER_LOGFILE_STDOUT}" 2>> "${USER_LOGFILE_STDERR}"
  echo >&2 "==> Done"
fi

echo >&2 "Launching ${APPNAME_UPSTREAM} via Wine"

wine "${EXE}" \
  >> "${USER_LOGFILE_STDOUT}" 2>> "${USER_LOGFILE_STDERR}"

echo >&2 "==> Finished"
