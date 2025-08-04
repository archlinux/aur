#!/usr/bin/env bash

# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

set -eu

PKGNAME='book-of-hours'
echo >&2 "Launching app"
cd "/opt/${PKGNAME}/data/noarch"
exec ./start.sh "$@"
