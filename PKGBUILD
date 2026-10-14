# Maintainer: Ivan Reutov <nujievik@gmail.com>

pkgname=mux-media-bin
pkgver=0.19.2
pkgrel=1
pkgdesc="CLI utility to mux (merge) video, audio, and subtitles"
arch=("x86_64" "i686")
url="https://github.com/nujievik/mux-media"
license=("MIT OR Apache-2.0")
options=("!debug")

source_x86_64=("$url/releases/download/v$pkgver/mux-media-Linux-x64.zip")
source_i686=("$url/releases/download/v$pkgver/mux-media-Linux-x32.zip")

sha256sums_x86_64=('b011cb26ff903e92d041ba64873854b7d84033cc6e0a7dd1f9bea3402f07d983')
sha256sums_i686=('be6ece93ddf2ccfd43745096754eeeadda6e85d947364cf919dd5c07885c7cbe')

package() {
    install -Dm755 "$srcdir/mux-media" "$pkgdir/usr/bin/mux-media"
}
