#!/bin/bash

### Wrapper for the windows-software "IDOS timetable browser".
#   This wrapper does start the software with 'wine' from the correct
#   directory (where it can find it's .dll files), and does some
#   command line argument reformatting so that filenames can be
#   specified both absolutely and relatively to the directory the user
#   starts this wrapper from.
#
#   Also, it starts with a Czech locale, if available, in order to make
#   diacritical characters display correctly.



### Global variables:

# Where this wrapper is started from:
_cwd="$(pwd)"

# Where the software is installed:
_installdir="/opt/idos-timetable"

# What the executable of the software is:
_executable="${_installdir}/TT.exe"

# Print some debug messages? Can be controlled via environment; if not
# specified in the environment, set it here:
if [ -z "${DEBUG}" ]; then
  DEBUG="true"
fi



### Some helper functions:

debug() {
  case "${DEBUG}" in
    "1"|[yY][eE][sS]|[tT][rR][uU][eE])
      echo "DEBUG info: $@" > /dev/stderr
    ;;
  esac
}

rebase_absolute_path() {
  # Arguments:
  #  $1: The new base path (assumed to be absolute and not containing double-'/'),
  #  $2: The absolute path which should be made a relative path based on $1 (needs to be an absolute path).
  _newbase="$1"
  _oldpath="$2"
  
  _depth_new="$(echo "${_newbase}" | tr -d '\n' | tr '/' '\n' | wc -l)" # Get the depth of $_newbase.
  _updir_string=''
  for i in $(seq 1 "${_depth_new}"); do # Put as much '../' into a string in order to reach / from $_newbase
    _updir_string="../${_updir_string}"
  done
  _updir_string="$(echo "${_updir_string}" | head -c-2)" # Remove the trailing '/'.
  
  _newpath="${_updir_string}${_oldpath}"
  
  echo "${_newpath}"
}

rebase_relative_path() {
  # Arguments:
  #   $1: Old base path (assumed to be absolute and not containing double-'/'),
  #   $2: New base path (assumed to be absolute and not containing double-'/'),
  #   $3: Relative path based on $1 to be rebased to $2.
  _oldbase="$1"
  _newbase="$2"
  _oldpath="$3"
  
  echo "$(rebase_absolute_path "${_newbase}" "${_oldbase}/${_oldpath}")"
}



### Do some option parsing:
#   * Convert "-h", "-help" or "--help" to "/?",
#   * convert pathnames to relative ones with regard to $_installdir,
#     which is necessary since
#     - the windows software would treat absolute pathnames, in the
#       Unix-world starting with '/', as options to the software,
#     - relative pathnames specified by the user need to be relative
#       with regard to the directory the software is run from. (We need
#       to change the directory so the software can find necessary
#       .dll files.)

# First, copy the positional parameters into a new (modifiable) array;
# with indices numbered in the same way as the positional paramaters
# (exept that we won't have 0):

argsnew=()

for j in $(seq "$(($#-1))" -1 0); do
  i="$(($#-$j))"
  argsnew[$i]="${BASH_ARGV[$j]}"
done

# Now, parse the positional arguments. The software understands the
# following arguments:
#   - Filenames to *.tt-files: Timetable files to use.
#   - /?: Help on arguments.
#   - /W:[CATZ], /L:*, /D:*, /C, /P, /I, /X:[23], /M:B, /O, /1, /2:*, /Z:*
#
# So, we will go as follows:
#   - Convert any '-h', '-help' or '--help' to '/?,
#   - If we encounter anything that does not begin with '/' or is not
#     '-h', '-help' or '--help', assume that it is a filename relative
#     to the directory $_cwd, and make it a filename relative to the
#     directory $_installdir.
#   - If we encounter something which mathes any of the options above,
#     leave it as it is,
#   - Assume that the rest is an absolute filename, and make it a
#     filename relative to the directory $_installdir.

for i in $(seq 1 "$#"); do
  case "${argsnew[$i]}" in
    "-h"|"-help"|"--help")
      argsnew[$i]="/?"
    ;;
    [^/]*)
      argsnew[$i]="$(rebase_relative_path "${_cwd}" "${_installdir}" "${argsnew[$i]}")"
    ;;
    "/?"|"/W:"[CATZ]|"/L:"*|"/D:"*|"/C"|"/P"|"/I"|"/X:"[23]|"/M:B"|"/O"|"/1"|"/2:"*|"/Z:"*)
      true
    ;;
    *)
      # Now, everything left is assumed to be an absolute filename.
      argsnew[$i]="$(rebase_absolute_path "${_installdir}" "${argsnew[$i]}")"
    ;;
  esac
done



### Check for locale, and if present, set Czech locale:

if locale -a | grep -qE '^cs_CZ'; then
  if locale -a | grep -qE '^cs_CZ' | grep -qi utf8; then
    LC_CTYPE="$(locale -a | grep -E '^cs_CZ' | grep -i utf8 | head -n 1)"
  else
    LC_CTYPE="$(locale -a | grep -E '^cs_CZ' | tail -n 1)"
  fi
  export LC_CTYPE
fi



### Launch the software with the parsed and maybe reformatted arguments:

cd "${_installdir}"

debug '$LC_CTYPE is set to: '"'${LC_CTYPE}' (if it does not begin with 'cs_CZ', try to enable Czech locale on your system to display diacritical characters correctly)."
debug "We are running from the directory: '$(pwd)'."
debug "Executing the following command: 'wine ${_executable} ${argsnew[@]}'."

wine "${_executable}" "${argsnew[@]}"
