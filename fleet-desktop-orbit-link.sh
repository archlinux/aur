#!/bin/sh
set -eu

SRC=/usr/bin/fleet-desktop
TARGET=/opt/fleet-orbit/bin/desktop/linux/stable/fleet-desktop/fleet-desktop

if test -L "${TARGET}"; then
  exit 0
fi

if test -e "${TARGET}"; then
  >&2 echo "WARNING: ${TARGET} exists and is not a symlink."
  >&2 echo "         It was probably automatically downloaded by fleet-orbit."
  >&2 echo "         Please remove it manually and reinstall fleet-desktop."
  exit 1
fi

mkdir -p "$(dirname "${TARGET}")"
ln -s "${SRC}" "${TARGET}"
