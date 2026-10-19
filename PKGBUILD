# Maintainer: Ivan Reutov <nujievik@gmail.com>

pkgname=mux-media-bin
provides=("mux-media")
conflicts=("mux-media")
pkgver=0.19.4
pkgrel=1
pkgdesc="CLI utility to mux (merge) video, audio, and subtitles"
arch=("x86_64" "i686")
url="https://github.com/nujievik/mux-media"
license=("MIT OR Apache-2.0")
options=("!debug")

source_x86_64=("$url/releases/download/v$pkgver/mux-media-Linux-x64.zip")
source_i686=("$url/releases/download/v$pkgver/mux-media-Linux-x32.zip")

sha256sums_x86_64=('fae3d1611be94f1a1c07d9a38eefc2b65f98be1f024dd36f8b77c3985c5ac843')
sha256sums_i686=('48351df00a7a6ed9f5a3dcd75601330eb03d6f0abe4805396a6144249b57ede4')

package() {
    install -Dm755 "$srcdir/mux-media" "$pkgdir/usr/bin/mux-media"
}
