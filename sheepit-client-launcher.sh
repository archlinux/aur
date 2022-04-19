#!/usr/bin/env bash

# Prohibit running as root
if [ "($id -u)" == "0" ]; then
  echo 'This launcher should not be run as root.';
  exit 1;
fi

# Set up data directory
_DATA="${XDG_DATA_HOME:-$HOME/.local/share}/sheepit-client-launcher";
if [[ ! -d "${_DATA}" ]]; then
  mkdir -pv "${_DATA}";
fi

check_update() {
  echo 'Checking for update..';

  { _CHECKED_AT=$(< "${_DATA}/update_checked_at"); } 2>/dev/null
  _CHECKED_AT="${_CHECKED_AT:-0}";
  _NEXT_CHECK_AT=$(("${_CHECKED_AT}" + 60 * 10));

  if (( "${_NEXT_CHECK_AT}" > "$(date +%s)" )); then
    echo 'Checking for update.. SKIPPED (reason: recently done)';
    return 0;
  fi

  echo -n 'Fetching MD5 of latest release.. ';
  _MD5_LATEST=$(curl --fail --silent https://www.sheepit-renderfarm.com/media/applet/client-info.php?get=md5);
  if [[ -z "${_MD5_LATEST}" ]]; then
    echo 'FAILED (reason: request error)'
    return 0;
  fi
  echo "${_MD5_LATEST}";

  echo -n 'Fetching MD5 of the current client.. ';
  _MD5_CURRENT=$(md5sum ${_DATA}/sheepit-client.jar | cut -f1 -d' ');
  echo "${_MD5_CURRENT}";

  if [[ "${_MD5_LATEST}" != "${_MD5_CURRENT}" ]]; then
    update;
  else
    echo 'Checking for update.. DONE.'
  fi

  date +%s > "${_DATA}/update_checked_at";
}

update() {
  echo 'Updating client..';

  echo -n 'Downloading file.. ';
  _TARGET=$(curl -OJ -s -w '%{filename_effective}' --output-dir "${_DATA}" 'https://www.sheepit-renderfarm.com/media/applet/client-latest.php');
  echo "${_TARGET}";

  echo 'Linking file..';
  ln -sfv "${_TARGET}"  "${_DATA}/sheepit-client.jar";

  echo 'Updating client.. DONE.';
}

if [[ ! -e "${_DATA}/sheepit-client.jar" ]]; then
  update;
else
  check_update;
fi

_CLIENT=$(readlink "${_DATA}/sheepit-client.jar");
echo "Launching ${_CLIENT%.jar}."
exec java -jar "${_DATA}/sheepit-client.jar" "$@";
