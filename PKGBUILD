#!/bin/sh
# PKGBUILD for release package (builds from tagged source)
# This is used for the AUR system-bridge package

pkgname=system-bridge
pkgver=5.0.0.beta.3
pkgrel=1
pkgdesc="A bridge for your systems"
arch=('x86_64')
url="https://github.com/timmo001/system-bridge"
license=('Apache-2.0')
keywords=('system-bridge' 'automation' 'home-assistant' 'api' 'websocket')
depends=('libx11' 'libxtst' 'libxkbcommon' 'libxkbcommon-x11')
makedepends=('go' 'bun-bin')
provides=('system-bridge')
conflicts=('system-bridge-git')

# Build from the tagged source tarball
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/timmo001/system-bridge/archive/refs/tags/5.0.0-beta.3.tar.gz")
sha256sums=('10f6ece1e540d1699f0462707afb1d6727943cab2c4f094238ae6f14a2a8cc3f')
