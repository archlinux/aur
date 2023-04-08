#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2023 George Rawlinson <george@rawlinson.net.nz>
#
# SPDX-License-Identifier: GFDL-1.3-or-later

# idea for wrapper taken from upstream:
# https://gitlab.com/open-runescape-classic/idlersc/-/blob/8d7473b4365e1e2ea8c434991ca21196b3021e20/src/bot/Main.java#L766-819

SERVER=""

case "$@" in
  *"-i uranium"*)
    ;&
  *"--init-cache uranium"*)
    SERVER="uranium"
    ;;
  *"-i coleslaw"*)
    ;&
  *"--init-cache coleslaw"*)
    SERVER="coleslaw"
    ;;
esac

# useful variables
LOCAL_DATA_DIR="${XDG_DATA_HOME:-${HOME}/.local/share}"
USER_DATA_DIR="${LOCAL_DATA_DIR}/idlersc/${SERVER}"
IDLERSC_JAR="/usr/share/java/idlersc/IdleRSC.jar"

# check if $SERVER matches either coleslaw or uranium
if [ "$SERVER" == "coleslaw" ] || [ "$SERVER" == "uranium" ]; then

  # create idlersc directory if it doesn't exist
  if [ ! -d "${USER_DATA_DIR}" ]; then
    mkdir -p "${USER_DATA_DIR}"
  fi

  # remove obsolete bin directory
  if [ -e "${USER_DATA_DIR}/bin" ]; then
    printf "Removing obsolete scripting directory for %s …\n" "${SERVER^}"
    rm -rf "${USER_DATA_DIR:?}/bin"
  fi

  if [ -e "${USER_DATA_DIR}/Map" ]; then
    printf "Removing obsolete Map directory for %s …\n" "${SERVER^}"
    rm -rf "${USER_DATA_DIR:?}/Map"
  fi

  # launch IdleRSC
  cd "${USER_DATA_DIR}" || exit 1
  exec java -jar "${IDLERSC_JAR}" "$@"

  exit 0
fi

java -jar "${IDLERSC_JAR}" "$@"
