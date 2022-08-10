#!/usr/bin/env bash
set -eu

PKGNAME='inscryption'
PKG_USER_DATA_HOME="${XDG_DATA_HOME:-"${HOME}/.local/share"}/${PKGNAME}"

echo >&2 "Initializing"

APPDIR_SOURCE='/opt/inscryption/data/noarch'
USER_OVERLAYDIR="${PKG_USER_DATA_HOME}/overlay"

echo >&2 "Refreshing symlinks from ${USER_OVERLAYDIR}"

echo >&2 "==> Creating ${USER_OVERLAYDIR}"
mkdir >&2 -pv "${USER_OVERLAYDIR}/game"

echo >&2 "==> Linking from ${APPDIR_SOURCE}"
cd "${USER_OVERLAYDIR}"
ln >&2 -fnsv "${APPDIR_SOURCE}/start.sh" 'start.sh'
ln >&2 -fnsv "${APPDIR_SOURCE}/support" 'support'
ln >&2 -fnsv "${APPDIR_SOURCE}/game/Inscryption_Data" 'game/Inscryption_Data'
ln >&2 -fnsv "${APPDIR_SOURCE}/game/UnityPlayer.so" 'game/UnityPlayer.so'

# Copy the launcher binary because symlinking would cause it to
# pick up its own real path
cp -vP --preserve=mode "${APPDIR_SOURCE}/game/Inscryption.x86_64" 'game/'

echo >&2 "==> Done"

# Migrate saved game files from the earlier, Wine-based package;
# the native Linux version of Inscryption expects the saved game to
# live in the `game` subdirectory
echo >&2 "Migrating saved game files from previous version"
find "${USER_OVERLAYDIR}" -mindepth 1 -maxdepth 1 -name '*.gwsave' \
  -exec mv -nv '{}' "${USER_OVERLAYDIR}/game/" ';' >&2

echo >&2 "Launching app"
cd "${USER_OVERLAYDIR}"
./start.sh "$@"
echo >&2 "==> Finished"
