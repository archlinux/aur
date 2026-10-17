# Maintainer: Ivan Reutov <nujievik@gmail.com>

pkgname=mux-media-bin
provides=("mux-media")
conflicts=("mux-media")
pkgver=0.19.3
pkgrel=1
pkgdesc="CLI utility to mux (merge) video, audio, and subtitles"
arch=("x86_64" "i686")
url="https://github.com/nujievik/mux-media"
license=("MIT OR Apache-2.0")
options=("!debug")

source_x86_64=("$url/releases/download/v$pkgver/mux-media-Linux-x64.zip")
source_i686=("$url/releases/download/v$pkgver/mux-media-Linux-x32.zip")

sha256sums_x86_64=('79c549620c451a56459946ca4459e7d2eded4e08c5090f20db7cf5102ff4dc4d')
sha256sums_i686=('ff03b8e53f7fdcd48d438dde19d931b2faab0bfced1481f6adb3dccd87e44e36')

package() {
    install -Dm755 "$srcdir/mux-media" "$pkgdir/usr/bin/mux-media"
}
