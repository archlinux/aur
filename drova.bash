#!/usr/bin/env bash

# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

set -eu

PKGNAME='drova-forsaken-kin'
echo >&2 "Launching game"
cd "/opt/${PKGNAME}"
exec ./start.sh "$@"
