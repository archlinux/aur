#!/bin/sh
set -eu

TARGET="/opt/fleet-orbit/bin/desktop/linux/stable/fleet-desktop/fleet-desktop"

if test -L "${TARGET}"; then
  rm "${TARGET}"
fi
