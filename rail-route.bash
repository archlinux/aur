#!/usr/bin/env bash

# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

set -eu

PKGNAME='rail-route'
echo >&2 "Launching app"
cd "/opt/${PKGNAME}"
exec ./start.sh "$@"
