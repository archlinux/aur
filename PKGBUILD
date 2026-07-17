# Maintainer: ChouChiu
# SPDX-FileCopyrightText: 2026 ChouChiu
# SPDX-License-Identifier: AGPL-3.0-only

pkgname=floatlyrics-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='Floating synchronized lyrics for Spotify on Linux Wayland (prebuilt binary)'
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
    'openssl'
    'pango'
    'webkitgtk-6.0'
)
provides=("floatlyrics=$pkgver")
conflicts=('floatlyrics')
source_x86_64=("$pkgname-$pkgver.rpm::$url/releases/download/v$pkgver/floatlyrics-$pkgver-1.$CARCH.rpm")
sha256sums_x86_64=('a154a005133cb69a6feb66d1a8365a463da3f77306bef76693b2c057bfc9808b')

package() {
    cp -a usr "$pkgdir/"
}
