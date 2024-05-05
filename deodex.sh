#!/bin/sh

_pkgname='vdex-extractor'

# Wrapper script to run the 'deodex' tool -- it does not like symlinking because then it does not find it's 'constants.sh' file it needs to source.

exec "/usr/lib/${_pkgname}/tools/deodex/run.sh" "$@"
