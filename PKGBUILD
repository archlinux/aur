# Maintainer: Ivan Reutov <nujievik@gmail.com>

pkgname=mux-media-bin
provides=("mux-media")
conflicts=("mux-media")
pkgver=0.20.2
pkgrel=1
pkgdesc="CLI utility to mux (merge) video, audio, and subtitles"
arch=("x86_64" "i686")
url="https://github.com/nujievik/mux-media"
license=("MIT OR Apache-2.0")
options=("!debug")

source_x86_64=("$url/releases/download/v$pkgver/mux-media-Linux-x64.zip")
source_i686=("$url/releases/download/v$pkgver/mux-media-Linux-x32.zip")

sha256sums_x86_64=('0747e89d0a42833e86d35849b27339cb8914dc41c42ad74e1cd4bc2c47bb3cb6')
sha256sums_i686=('d3a1f367d86765302ef76c12bc4423987ce7390c737e9c25d3542e1ebe4fcac9')

package() {
    install -Dm755 "$srcdir/mux-media" "$pkgdir/usr/bin/mux-media"
}
