# Maintainer: ChouChiu
# SPDX-FileCopyrightText: 2026 ChouChiu
# SPDX-License-Identifier: AGPL-3.0-only

pkgname=floatlyrics-bin
pkgver=1.4.0
pkgrel=1
pkgdesc='Floating synchronized lyrics for MPRIS players on Linux Wayland (prebuilt binary)'
arch=('x86_64')
url='https://github.com/ChouChiu/FloatLyrics'
license=('AGPL-3.0-only')
depends=(
    'cairo'
    'glib2'
    'glibc'
    'gtk4'
    'gtk4-layer-shell'
    'libgcc'
    'pango'
    'webkitgtk-6.0'
)
provides=("floatlyrics=$pkgver")
conflicts=('floatlyrics')
source_x86_64=("$pkgname-$pkgver.rpm::$url/releases/download/v$pkgver/floatlyrics-$pkgver-1.$CARCH.rpm")
sha256sums_x86_64=('5528abdfdba94ac4d7a2241f07e02182b1f974f7363100800edf4c355a014236')

package() {
    cp -a usr "$pkgdir/"
}
