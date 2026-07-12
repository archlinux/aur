# Maintainer: ChouChiu
# SPDX-FileCopyrightText: 2026 ChouChiu
# SPDX-License-Identifier: GPL-3.0-or-later

pkgname=floatlyrics-bin
pkgver=1.0.0
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
sha256sums_x86_64=('a8a08a927b1d5f7baf5bfb490262a4de0f5a07c37050cfb2455fcfb17212c273')

package() {
    cp -a usr "$pkgdir/"
}
