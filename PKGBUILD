# Maintainer: ChouChiu
# SPDX-FileCopyrightText: 2026 ChouChiu
# SPDX-License-Identifier: GPL-3.0-or-later

pkgname=floatlyrics-bin
pkgver=1.0.1
pkgrel=1
pkgdesc='Floating synchronized lyrics for Spotify on Linux Wayland (prebuilt binary)'
arch=('x86_64')
url='https://github.com/ChouChiu/FloatLyrics'
license=('GPL-3.0-or-later')
depends=(
    'cairo'
    'glib2'
    'glibc'
    'gtk4'
    'gtk4-layer-shell'
    'libgcc'
    'openssl'
    'pango'
)
provides=("floatlyrics=$pkgver")
conflicts=('floatlyrics')
source_x86_64=("$pkgname-$pkgver.rpm::$url/releases/download/v$pkgver/floatlyrics-$pkgver-1.$CARCH.rpm")
sha256sums_x86_64=('f16b0e8e239ee3b50939cf4c17a34fdfa03f4509c870fdeb30a3223ffe948bc5')

package() {
    cp -a usr "$pkgdir/"
}
