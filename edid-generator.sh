#!/bin/bash

set -e

_libdir="/usr/lib/edid-generator"
_workdir="$(mktemp --tmpdir=/tmp -d edid-generator-XXXX)"

cp "${_libdir}"/{Makefile,edid.S,hex} "${_workdir}"/

cd "${_workdir}"

"${_libdir}/modeline2edid" "$@"

printf '\n'
make
printf '\n'

printf '%s\n' "Output files are in '${_workdir}'."
printf '\n'
printf '%s\n' "Specifically, it are:"
ls -1 *.bin | while read _f; do
  printf '%s\n' "* '${_workdir}/${_f}'"
done
