# Maintainer: Ivan Reutov <nujievik@gmail.com>

pkgname=mux-media-bin
pkgver=0.19.0
pkgrel=1
pkgdesc="CLI utility to mux (merge) video, audio, and subtitles"
arch=("x86_64" "i686")
url="https://github.com/nujievik/mux-media"
license=("MIT OR Apache-2.0")

source_x86_64=("$url/releases/download/v$pkgver/mux-media-Linux-x64.zip")
source_i686=("$url/releases/download/v$pkgver/mux-media-Linux-x32.zip")

sha256sums_x86_64=("edce0229af37acf1b97f0b4a184852d68e9e5c9250159ea33c5bf64a8ce7ce5c")
sha256sums_i686=("140a9ea747dc96f00e7cd5401e2ab7adc30ab6b1c1a918a477f3cd4872ad39e6")

package() {
    install -Dm755 "$srcdir/mux-media" "$pkgdir/usr/bin/mux-media"
}
