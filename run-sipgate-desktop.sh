#!/usr/bin/env bash

export VITE_WORKSPACE_BASE_URL="${VITE_WORKSPACE_BASE_URL:-https://workspace.sipgate.com}"

compare_versions() {
  local VERSIONA=${1%%.*} VERSIONB=${2%%.*}

  [[ "10#${VERSIONA:-0}" -gt "10#${VERSIONB:-0}" ]] && return 1
  [[ "10#${VERSIONA:-0}" -lt "10#${VERSIONB:-0}" ]] && return 2

  VERSIONA=${1:${#VERSIONA}+1}
  VERSIONB=${2:${#VERSIONB}+1}

  [[ -z $VERSIONA && -z $VERSIONB ]] && return 0 || compare_versions "$VERSIONA" "$VERSIONB"
}

latest_remote_version() {
  local LATEST LATEST_LINUX
  LATEST=$(wget --quiet -O - https://desktop.download.sipgate.com/latest.yml | yq -r '.version')
  LATEST_LINUX=$(wget --quiet -O - https://desktop.download.sipgate.com/latest-linux.yml | yq -r '.version')

  echo "latest version: ${LATEST}" >&2
  echo "latest linux version: ${LATEST_LINUX}" >&2

  compare_versions "$LATEST" "$LATEST_LINUX"
  local result=$?
  if [[ $result -eq 1 ]]; then
    echo "$LATEST"
  else
    echo "$LATEST_LINUX"
  fi
}

INSTALLED_VERSION=$(pacman -Qi sipgate | sed -r -n 's/^Version\s*:\s*([0-9\.]+).*$/\1/p')
LATEST_VERSION=$(latest_remote_version)

echo >&2
echo "installed version: ${INSTALLED_VERSION}" >&2
echo "latest overall version: ${LATEST_VERSION}" >&2
echo >&2

compare_versions "$INSTALLED_VERSION" "$LATEST_VERSION"
result=$?
if [[ $result -ge 2 ]]; then
  MSG="Please install the latest version of the sipgate package (${LATEST_VERSION}). If there is no AUR package available yet for this version, you may notify the maintainers at https://aur.archlinux.org/packages/sipgate"
  notify-send "$MSG"
  echo "$MSG" >&2
  exec /opt/sipgate/sipgate-desktop "$@"
else
  exec /opt/sipgate/sipgate-desktop "$@"
fi
