#!/usr/bin/env bash
set -eu

PKGNAME='pony-island'
PKG_USER_DATA_HOME="${XDG_DATA_HOME:-"${HOME}/.local/share"}/${PKGNAME}"

echo >&2 "Initializing"

APPDIR_SOURCE='/opt/pony-island/data/noarch'
USER_OVERLAYDIR="${PKG_USER_DATA_HOME}/overlay"

echo >&2 "Refreshing symlinks from ${USER_OVERLAYDIR}"

echo >&2 "==> Creating ${USER_OVERLAYDIR}"
mkdir >&2 -pv "${USER_OVERLAYDIR}/game/64"

echo >&2 "==> Linking from ${APPDIR_SOURCE}"
cd "${USER_OVERLAYDIR}"
ln >&2 -fnsv "${APPDIR_SOURCE}/start.sh" 'start.sh'
ln >&2 -fnsv "${APPDIR_SOURCE}/support" 'support'
ln >&2 -fnsv "${APPDIR_SOURCE}/game/64/PonyIsland_Data" 'game/64/PonyIsland_Data'

# Copy the launcher binary because symlinking would cause it to
# pick up its own real path
cp -vP --preserve=mode "${APPDIR_SOURCE}/game/64/PonyIsland.x86_64" \
  'game/64/'

echo >&2 "==> Done"

echo >&2 "Launching app"
cd "${USER_OVERLAYDIR}"
./start.sh "$@"
echo >&2 "==> Finished"
