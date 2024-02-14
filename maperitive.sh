#!/bin/bash

### Wrapper for the windows- or Mono-software "Maperitive".
#   This wrapper does start the software with 'mono' from the correct
#   directory (where it has write access) and creates it if not already
#   Present (it just copies the installation there).

### Global variables:

_installdir="/usr/share/maperitive"
_rundir="${HOME}/.maperitive"
_fakedir="${_rundir}/fake"
_maperitiveexecutable="${_rundir}/Maperitive.exe"
_maperitiveoptions=()
_monoexecutable="mono"
_monoptions=()

# If 'elinks' is found, then it opens a help page in the terminal first, and only continues to run if 'elinks' is quit. We want to avoid this, so we installed a "elinks" fake script that does nothing and prepend it's directory to '$PATH'.
export PATH="${_fakedir}:${PATH}"

if ! [ -e "${_rundir}" ]; then
  printf '%s\n' "Local maperitive directory '${_rundir}' does not exist."
  printf '%s\n' "Copying installation from '${_installdir}' to '${_rundir}'"
  printf '%s\n' "since it needs write access to it's directory ..."
  cp -r "${_installdir}" "${_rundir}"
elif [ -e "${_rundir}" ] && ! [ -d ${_rundir} ]; then
  {
    printf '%s\n' "'${_rundir}' exists but is not a directory."
    printf '%s\n' "'${_rundir}' needs to be a directory containing the Maperitive installation,"
    printf '%s\n' "or non-existing so it will automatically be copied there from '${_installdir}'."
    printf '%s\n' "Aborting."
  } > /dev/stderr
  exit 11
elif [ -d "${_rundir}" ]; then
  printf '%s\n' "Launching '${_maperitiveexecutable}' with '${_monoexecutable}' ..."
  printf '\n'
  printf '%s\n' "NOTE:"
  printf '%s\n' "Assuming '${_rundir}' contains a full installation of Maperitive."
  printf '%s\n' "(To re-generate, copy from '${_installdir}/'.)"
  printf '\n'
else
  {
    printf '%s\n' "Reached a branch in '$0' that should never be reached."
    printf '%s\n' "This is a bug in '$0', please report to the distribution package maintainer (not to Maperitive!)."
    printf '%s\n' "Aborting."
  } > /dev/stderr
  exit 19
fi

"${_monoexecutable}" "${_monoptions[@]}" "${_maperitiveexecutable}" "${_maperitiveoptions[@]}" "$@"
