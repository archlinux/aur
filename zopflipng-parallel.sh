#!/bin/bash
# 
# zopflipng-parallel
# Executes 'zopflipng' in parallel on all the files specified as arguments, overwriting the input files.
# Opionally, with option `-j<num>`, parallel execution can be limited to `<num>` processes at the same time.
# 
#
# License: GNU GPL Version 3 or later (at your choice), see http://www.gnu.org/licenses/gpl-3.0.en.html (as of 2018-05-20).
#
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#   
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#   
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# The version.
VERSION=0.1

# Abort on error
set -e

# How to output text to stdout:
stdout() {
  # Don't use 'echo', since it might interpret leading '-e', '-E', '-n' and maybe others.
  printf '%s\n' "$@"
}

# Write to stderr:
stderr() {
  stdout "$@" 1>&2
}

# Print usage help:
printusage() {
  stdout "$0: Optimised PNG images for size in parallel"
  stdout "  (Executes 'zopflipng' in parallel on the files specified as arguments.)"
  stdout "  Input files are overwritten."
  stdout ""
  stdout "Usage:"
  stdout "  $0 -h|-help|--help:        Print this help message,"
  stdout "  $0 -V|-version|--version:  Print this script's version,"
  stdout "  $0 [-j <n>] [zopflipng options] [--] [file(s)]:"
  stdout "  - Optional argument '-j <n>':               Limit to max. '<n>' processes in parallel at the same time, must be the first argument and the number of processes must be separated by space. Default: Number of processing cores (`nproc`);"
  stdout "  - optional arguments '[zopflipng options]':  Pass those options to 'zopflipng' (e.g. '-m', '--lossy_transparent', '--filters=0me', '--filters=b', '--filters=01234mepb' etc.);"
  stdout "  - argument(s) '[file(s)]':                 PNG files to optimise."
  stdout ""
  stdout "  IMPORANT:"
  stdout "    If any 'zopflipng options' is set, the first one needs to start with '-', and the separator '--' between the zopflipng options and the files is mandatory."
}

_nproc="`nproc`"
_zopflipng_options=()
_files=()
_parsemode='none'
case "$1" in
  '-V'|'-version'|'--version')
    stdout "${VERSION}"
    exit 0
  ;;
  '-h'|'-help'|'--help')
    printusage
    exit 0
  ;;
  '-j')
    if [ "$#" -lt 2 ]; then
      stderr "$0: Error: Option '-j' needs an argument."
      stderr "Run '$0 -h' for help."
      stderr "Aborting."
      exit 1
    fi
    _nproc="$2"
    shift
    shift
  ;;
esac

case "$1" in
  -*)
    _parsemode=options
  ;;
  *)
    _parsemode=files
  ;;
esac

while [ "$#" -ge 1 ]; do
  if [ "${_parsemode}" == "files" ]; then
    _files+=("$1")
  elif [ "${_parsemode}" == "options" ]; then
    if [ "$1" == "--" ]; then
      _parsemode="files"
    else
      _zopflipng_options+=("$1")
    fi
  fi
  shift
done

#stdout "DEBUG: files:"
#stdout "${_files[@]}"
#stdout ""
#stdout "DEBUG: options"
#stdout "${_zopflipng_options[@]}"

#stdout "DEBUG: Would execute:"
#stdout "printf '%s\n' \"${_files[@]}\" | parallel -j \"${_nproc}\" zopflipng -y \"${_zopflipng_options[@]}\" {} {}"


# To make 'zopflipng' overwrite the input file, call it as 'zopflipng <inputfile> <inputfile>' (yes, same filename twice). To not ask for confirmation, use '-y' argument.

printf '%s\n' "${_files[@]}" | parallel -j "${_nproc}" zopflipng -y "${_zopflipng_options[@]}" {} {}
