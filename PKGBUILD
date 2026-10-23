# Maintainer: Ivan Reutov <nujievik@gmail.com>

pkgname=mux-media-bin
provides=("mux-media")
conflicts=("mux-media")
pkgver=0.19.7
pkgrel=1
pkgdesc="CLI utility to mux (merge) video, audio, and subtitles"
arch=("x86_64" "i686")
url="https://github.com/nujievik/mux-media"
license=("MIT OR Apache-2.0")
options=("!debug")

source_x86_64=("$url/releases/download/v$pkgver/mux-media-Linux-x64.zip")
source_i686=("$url/releases/download/v$pkgver/mux-media-Linux-x32.zip")

sha256sums_x86_64=('5ea4e8f05c7f2dc863f0ebc8b9f5d0ae399eeb2d0bdf95c5a383b1bbf5d9a112')
sha256sums_i686=('a1ffeab4bbfcbe006f3758466991fd75fdc4e86d89518e82d178a18cbbdc6f21')

package() {
    install -Dm755 "$srcdir/mux-media" "$pkgdir/usr/bin/mux-media"
}
