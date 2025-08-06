#!/usr/bin/env bash
set -euo pipefail

pkgver=$(grep "^pkgver=" PKGBUILD | tail -c +8)
_pkgver=${pkgver//_/-}
curl "https://releases.threema.ch/desktop/${_pkgver}/threema-desktop-v${_pkgver}-source.7z.b2"
