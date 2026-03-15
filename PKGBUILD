# SPDX-FileContributor: Bruce Hill <contact@bruce-hill.com>
# SPDX-FileCopyrightText: 2025 Bruce Hill
# SPDX-License-Identifier: 0BSD
# Maintainer: Bruce Hill <contact@bruce-hill.com>
pkgname=tomo-bin
_tomo_version=2026-03-14
pkgver="${_tomo_version//-/_}"
pkgrel=1
pkgdesc='The Tomo programming language compiler'
arch=('x86_64')
url="https://tomo.bruce-hill.com"
license=('custom')
depends=('gcc' 'binutils' 'gmp' 'libunistring' 'gc')
source=("https://tomo.bruce-hill.com/dist/tomo@${_tomo_version}_Linux-${CARCH}.tar.gz")
sha256sums=('e6389315da8342583666c8968b3407fa8915edfb44641ea7ead057ee20a40d9b')
package() {
    cd "$srcdir"
    mkdir "$pkgdir/usr"
    tar -xzf "tomo@${_tomo_version}_Linux-${CARCH}.tar.gz" -C "$pkgdir/usr" --strip-components=1
}
