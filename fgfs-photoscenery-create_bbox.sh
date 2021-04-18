#!/bin/bash

_pkgname='flightgear-photoscenery-creatorscripts'
_scriptdir="/usr/lib/${_pkgname}/"
_scriptname='create_bbox.pl'

_path_absolute() {
  ## Makes the argument provided at "$1" an absolute path, if it is not already. Returns that to stdout.
  _path="$1"
  if [ "$(head -c1 <<<"${_path}")" != "/" ]; then
    _path="$(pwd)/${_path}"
  fi
  printf "%s" "${_path}"
}


## Make path arguments, if they are passed as relative ones, to absolute ones:
_args=()
while [ "$#" -ge 1 ]; do
  case "$1" in
    '--scenery_folder')
      if [ "$#" -lt 2 ]; then
        {
          printf '%s\n' "$0: Error: Argument '$1' needs to be followed by a path, but no further argument is specified."
          printf '%s\n' "Aborting."
        } > /dev/stderr
        exit 11
      fi
      _args+=("$1")
      _args+=("$(_path_absolute "$2")")
      shift
      shift
    ;;
    *)
      _args+=("$1")
      shift
    ;;
  esac
done


# ## for DEBUGging:
# printf '%s\n' "DEBUG: The following arguments would be passed:"
# for _arg in "${_args[@]}"; do
#   printf '%s\n' "${_arg}"
# done
# exit 0


cd "${_scriptdir}"
"./${_scriptname}" "${_args[@]}"
