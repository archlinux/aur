#!/bin/sh

_installdir="/opt/catch-my-bus-python"
_executable="catch_my_bus.py"

cd "${_installdir}"

"${_installdir}/${_executable}" "$@"
