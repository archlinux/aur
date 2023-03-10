#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2023 George Rawlinson <george@rawlinson.net.nz>
#
# SPDX-License-Identifier: GFDL-1.3-or-later

# idea for wrapper taken from upstream:
# https://gitlab.com/open-runescape-classic/idlersc/-/blob/8d7473b4365e1e2ea8c434991ca21196b3021e20/src/bot/Main.java#L766-819

SERVER="$1"

# check if $SERVER matches either coleslaw or uranium
if [ "$SERVER" == "coleslaw" ] || [ "$SERVER" == "uranium" ]; then
  # useful variables
  LOCAL_DATA_DIR="${XDG_DATA_HOME:-${HOME}/.local/share}"
  USER_DATA_DIR="${LOCAL_DATA_DIR}/idlersc/${SERVER}"
  IDLERSC_JAR="/usr/share/java/idlersc/IdleRSC.jar"
  IDLERSC_DATA_DIR="/usr/share/idlersc"

  # copy cache & map if the directory doesn't exist
  if [ ! -d "${USER_DATA_DIR}" ]; then
    printf "Creating cache for %s …\n" "${SERVER^}"
    mkdir -p "${USER_DATA_DIR}"
    cp -r "${IDLERSC_DATA_DIR}/${SERVER^}Cache" "${USER_DATA_DIR}/Cache"
    cp "${IDLERSC_DATA_DIR}/${SERVER^}Cache.hash" "${USER_DATA_DIR}/${SERVER^}Cache.hash"
    cp "${IDLERSC_DATA_DIR}/Map" "${USER_DATA_DIR}"
    cp "${IDLERSC_DATA_DIR}/Map.hash" "${USER_DATA_DIR}"
  fi

  # update cache if there is a hash mismatch
  if ! cmp --silent "${IDLERSC_DATA_DIR}/${SERVER^}Cache.hash" "${USER_DATA_DIR}/${SERVER^}Cache.hash"; then
    printf "Updating cache for %s …\n" "${SERVER^}"
    rm -rf "${USER_DATA_DIR}/Cache" "${USER_DATA_DIR}/${SERVER^}Cache.hash"
    cp -r "${IDLERSC_DATA_DIR}/${SERVER^}Cache" "${USER_DATA_DIR}/Cache"
    cp "${IDLERSC_DATA_DIR}/${SERVER^}Cache.hash" "${USER_DATA_DIR}/${SERVER^}Cache.hash"
  fi

  # update map if there is a hash mismatch
  if ! cmp --silent "${IDLERSC_DATA_DIR}/Map.hash" "${USER_DATA_DIR}/Map.hash"; then
    printf "Updating map for %s …\n" "${SERVER^}"
    rm -rf "${USER_DATA_DIR}/Map" "${USER_DATA_DIR}/Map.hash"
    cp -r "${IDLERSC_DATA_DIR}/Map" "${USER_DATA_DIR}"
    cp "${IDLERSC_DATA_DIR}/Map.hash" "${USER_DATA_DIR}/Map.hash"
  fi

  # remove obsolete bin directory
  if [ -e "${USER_DATA_DIR}/bin" ]; then
    printf "Removing obsolete scripting directory for %s …\n" "${SERVER^}"
    rm -rf "${USER_DATA_DIR:?}/bin"
  fi

  # launch IdleRSC
  cd "${USER_DATA_DIR}" || exit 1
  exec java -jar "${IDLERSC_JAR}" "${@:2}"
else
  # print usage
  cat <<-EOF
  Usage: $(basename "${0}") server [options]

  server:
    Server to connect to.
    Must be either 'uranium' or 'coleslaw'.

  [options]:
    Optional arguments passed to IdleRSC.
EOF
  exit 1
fi
