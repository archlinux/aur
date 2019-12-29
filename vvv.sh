#!/bin/sh

VVV_HOME="${HOME}/.vvv"
FIREBIRD_HOME="${VVV_HOME}/firebird"

# If Firebird data is missing create a new Firebird folder
if [ ! -d "${FIREBIRD_HOME}" ]
then
  mkdir -p "${FIREBIRD_HOME}"
  # Initial security database
  cp /usr/lib/vvv/firebird/security2.fdb "${FIREBIRD_HOME}"
  # Use an empty firebird.conf to use the FIREBIRD environment variable
  touch "${FIREBIRD_HOME}/firebird.conf"
  for _file in /usr/lib/vvv/firebird/firebird.msg \
               /usr/lib/vvv/firebird/bin \
               /usr/lib/vvv/firebird/intl \
               /usr/lib/vvv/firebird/lib*
  do
    ln -s "${_file}" "${FIREBIRD_HOME}/$(basename ${_file})"
  done
fi

# Launch application with the new paths
export LD_LIBRARY_PATH="${FIREBIRD_HOME}"
export FIREBIRD="${FIREBIRD_HOME}"
/usr/lib/vvv/vvv

