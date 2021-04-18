#!/bin/bash

_pkgname='flightgear-photoscenery-creatorscripts'
_scriptdir="/usr/lib/${_pkgname}/"
_scriptname='create_dds.sh'

cd "${_scriptdir}"

"./${_scriptname}" "$@"
