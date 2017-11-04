#!/bin/bash

### Wrapper for the windows-software "Entfernungsrechner für Fahrvergünstigungen".
#   This wrapper does start the software with 'wine' from the correct
#   directory (where it can find it's data files), and does some
#   command line argument reformatting so that filenames can be
#   specified both absolutely and relatively to the directory the user
#   starts this wrapper from.
#
#   Also, it starts with a German locale, if available, in order to make
#   diacritical characters display correctly.
#
#   Content taken from idos-timetable-browser.sh from the Arch Linux AUR package
#   'idos-timetable-browser-latest'. See there if command line argument parsing
#   and rebasing is needed here.



### Global variables:

# Where this wrapper is started from:
_cwd="$(pwd)"

# Where the software is installed:
_installdir="/opt/entfernungsrechner"

# What the executable of the software is:
_executable="${_installdir}/PFFEB.exe"

# Print some debug messages? Can be controlled via environment; if not
# specified in the environment, set it here:
if [ -z "${DEBUG}" ]; then
  DEBUG="true"
fi



### Some helper functions 

debug() {
  case "${DEBUG}" in
    "1"|[yY][eE][sS]|[tT][rR][uU][eE])
      echo "DEBUG info: $@" > /dev/stderr
    ;;
  esac
}



### Check for locale, and if present, set German locale:

if locale -a | grep -qE '^de_DE'; then
  if locale -a | grep -qE '^de_DE' | grep -qi utf8; then
    LC_CTYPE="$(locale -a | grep -E '^de_DE' | grep -i utf8 | head -n 1)"
  else
    LC_CTYPE="$(locale -a | grep -E '^de_DE' | tail -n 1)"
  fi
  export LC_CTYPE
fi



### Launch the software with the parsed and maybe reformatted arguments:

cd "${_installdir}"

debug '$LC_CTYPE is set to: '"'${LC_CTYPE}' (if it does not begin with 'de_DE', try to enable German locale on your system to display diacritical characters correctly)."
debug "We are running from the directory: '$(pwd)'."
debug "Executing the following command: 'wine ${_executable} $@'."

wine "${_executable}" "$@"
