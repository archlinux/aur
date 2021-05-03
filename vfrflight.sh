#!/bin/bash

set -e

_max_heap_mem=2048m
_initial_heap_mem=128m

_pkgname='vfrflight'
_installdir="/opt/${_pkgname}"
_homedir="${HOME}"
_localdir="${_homedir}/.${_pkgname}"
_executable_name="vfr-flight.jar"

msg() {
  printf "%s\n" "$1"
}

errmsg() {
  msg "$1" > /dev/stderr
}

_preparation() {
  msg "Preparation: $1"
}


### Create "$_localdir" if $_homedir is present and $_localdir is not present.
if [ -d "${_homedir}" ]; then
  if [ ! -e "${_localdir}" ] || [ -d "${_localdir}" ]; then
    if [ ! -e "${_localdir}" ]; then
      _preparation "Creating '${_localdir}'"
      mkdir "${_localdir}"
    fi
  else
    errmsg "Error: '${_localdir}' exists but is not a directory."
    errmsg "Aborting."
    exit 22
  fi
else
  errmsg "Error: Home-directory '${_homedir}' does not exist."
  errmsg "Aborting."
  exit 21
fi

ls -1d "${_installdir}"/* | while read _installitem; do
  if [ ! -e "${_localdir}/$(basename "${_installitem}")" ]; then
    _preparation "Symlinking '${_installitem}' -> '${_localdir}/$(basename "${_installitem}")'."
    ln -sr "${_installitem}" "${_localdir}/$(basename "${_installitem}")"
  fi
done

_preparation "Switching to directory '${_localdir}' ..."
cd "${_localdir}"
_preparation "Launching '"${_executable_name}"' ..."
java -Xms"${_initial_heap_mem}" -Xmx"${_max_heap_mem}" -Dfile.encoding=UTF-8 -jar ./"${_executable_name}" "$@"
