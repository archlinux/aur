#!/usr/bin/env bash
set -eu

PKGNAME='the-will-of-arthur-flabbington'

PKG_USER_DATA_HOME="${XDG_DATA_HOME:-"${HOME}/.local/share"}/${PKGNAME}"
mkdir -pv "${PKG_USER_DATA_HOME}"
cd "${PKG_USER_DATA_HOME}"

exec "/opt/${PKGNAME}/TWoAF" "$@"
