#!/bin/sh

_installdir="/usr/lib/node_modules/DDPlan"
_app="app.js"

electron "${_installdir}/${_app}" "$@"
