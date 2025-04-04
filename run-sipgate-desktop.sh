#!/usr/bin/env sh

compare_versions() {
  local VERSIONA=${1%%.*} VERSIONB=${2%%.*}

  [[ "10#${VERSIONA:-0}" -gt "10#${VERSIONB:-0}" ]] && return 1
  [[ "10#${VERSIONA:-0}" -lt "10#${VERSIONB:-0}" ]] && return 2

  VERSIONA=${1:${#VERSIONA}+1}
  VERSIONB=${2:${#VERSIONB}+1}

  [[ -z $VERSIONA && -z $VERSIONB ]] && return 0 || compare_versions "$VERSIONA" "$VERSIONB"
}

latest_remote_version() {
  local LATEST=$(wget --quiet -O - https://desktop.download.sipgate.com/latest.yml | yq -r '.version')
  local LATEST_LINUX=$(wget --quiet -O - https://desktop.download.sipgate.com/latest-linux.yml | yq -r '.version')

  echo "latest version: ${LATEST}" >&2
  echo "latest linux version: ${LATEST_LINUX}" >&2

  compare_versions "$LATEST" "$LATEST_LINUX"
  if [ $? -eq 1 ]; then
    echo "$LATEST"
  else
    echo "$LATEST_LINUX"
  fi
}

INSTALLED_VERSION=$(pacman -Qi sipgate-app-clinq | sed -r -n 's/^Version\s*:\s*([0-9\.]+).*$/\1/p')
LATEST_VERSION=$(latest_remote_version)

echo >&2
echo "installed version: ${INSTALLED_VERSION}" >&2
echo "latest overall version: ${LATEST_VERSION}" >&2
echo >&2

compare_versions "$INSTALLED_VERSION" "$LATEST_VERSION"
if [ $? -ge 2 ]; then
  MSG="Please install the latest version of the sipgate-app-clinq package (${LATEST_VERSION}). If there is no AUR package available yet for this version, you may notify the maintainers at https://aur.archlinux.org/packages/sipgate-app-clinq"
  notify-send "$MSG"
  echo "$MSG" >&2
  exit 1
else
  exec /opt/sipgate/sipgate-desktop
fi

