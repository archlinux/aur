#!/usr/bin/env bash
set -eu

PKGNAME='trans-neuronica'
PKG_USER_DATA_HOME="${XDG_DATA_HOME:-"${HOME}/.local/share"}/${PKGNAME}"

echo >&2 "Initializing"

APPDIR_SOURCE="/opt/${PKGNAME}"
USER_OVERLAYDIR="${PKG_USER_DATA_HOME}/overlay"

echo >&2 "Refreshing symlinks from ${USER_OVERLAYDIR}"

echo >&2 "==> Creating ${USER_OVERLAYDIR}"
mkdir >&2 -pv "${USER_OVERLAYDIR}/game"

echo >&2 "==> Linking from ${APPDIR_SOURCE}"
cd "${USER_OVERLAYDIR}"

# Symlink everything we need to play the game except the launcher binary
find /opt/trans-neuronica/game -mindepth 1 -maxdepth 1 \
  -name 'trans-neuronica*' \
  -prune -o \
  -exec ln -fnsv -t 'game' '{}' +

# Copy the launcher binary because symlinking would cause it to
# pick up its own real path
cp -vP --preserve=mode "${APPDIR_SOURCE}/game/trans-neuronica-game" 'game/'

echo >&2 "Launching app"
cd game
./trans-neuronica-game "$@"
echo >&2 "Finished"
