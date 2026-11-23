# Copyright (c) 2026 Athan Clark. SPDX-License-Identifier: GPL-3.0-only
# The server's AUR package was openchronology-server until 0.30, and is circagraph-server now.
# This last openchronology-server is empty and depends on circagraph-server, so that an AUR
# helper's upgrade installs it in place of the old package (README.Arch, "From
# openchronology-server"). Releases publish it (scripts/aur-packages.mjs --transitional) until
# the AUR merges openchronology-server into circagraph-server.
# Maintainer: Athan Clark <athan.clark@gmail.com>
pkgname=openchronology-server
pkgver=0.31.0
pkgrel=1
pkgdesc='Renamed circagraph-server: this transitional package installs it, and may be removed'
arch=('any')
url='https://github.com/circagraph/timeline-app'
license=('GPL-3.0-only')
depends=('circagraph-server')

package() {
  :
}
