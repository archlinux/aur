#!/bin/sh
# RunJam installs the agent CLIs with `npm install -g`. With a distro npm that
# would try to write into /usr, which is read-only for regular users, so point
# npm at a per-user prefix for this process and expose its bin directory.
: "${XDG_DATA_HOME:=${HOME}/.local/share}"
_prefix="${XDG_DATA_HOME}/runjam/npm"
mkdir -p "${_prefix}"
export npm_config_prefix="${_prefix}"
export PATH="${_prefix}/bin:${PATH}"

exec /usr/lib/RunJam/runjam "$@"
