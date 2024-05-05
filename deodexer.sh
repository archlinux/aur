#!/bin/sh

_pkgname='deodexer'
_vdex_extractor='/usr/bin/vdexExtractor'
_zipalign='/usr/bin/zipalign'

exec "/usr/lib/${_pkgname}/deodexer.py" --vdexextractor "${_vdex_extractor}" --zipalign "${_zipalign}" "$@"
