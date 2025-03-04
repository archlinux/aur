#!/usr/bin/env sh

INSTALLED_VERSION=$(pacman -Qi sipgate-app-clinq | sed -r -n 's/^Version\s*:\s*([0-9\.]+).*$/\1/p')
LATEST_VERSION=$(wget --quiet -O - https://desktop.download.sipgate.com/latest-linux.yml | yq -r '.version')

echo "installed version: ${INSTALLED_VERSION}"
echo "latest version: ${LATEST_VERSION}"
echo

if [ "x$LATEST_VERSION" != "x$INSTALLED_VERSION" ]; then
  MSG="Please install the latest version of the sipgate-app-clinq package (${LATEST_VERSION}). If there is no AUR package available yet for this version, you may notify the maintainers at https://aur.archlinux.org/packages/sipgate-app-clinq"
  notify-send "$MSG"
  echo "$MSG" >&2
  exit 1
else
  exec /opt/sipgate\ CLINQ/sipgate-desktop
fi

