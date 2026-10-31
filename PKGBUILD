# Maintainer: Ivan Reutov <nujievik@gmail.com>

pkgname=mux-media-bin
provides=("mux-media")
conflicts=("mux-media")
pkgver=0.20.1
pkgrel=1
pkgdesc="CLI utility to mux (merge) video, audio, and subtitles"
arch=("x86_64" "i686")
url="https://github.com/nujievik/mux-media"
license=("MIT OR Apache-2.0")
options=("!debug")

source_x86_64=("$url/releases/download/v$pkgver/mux-media-Linux-x64.zip")
source_i686=("$url/releases/download/v$pkgver/mux-media-Linux-x32.zip")

sha256sums_x86_64=('ecb923f2a9e1841a1d9926a78464bc444547fa6d35ba120e5a1ef778dbc539c9')
sha256sums_i686=('cca5221726d8084acb067877c915d8625b1297e7a7182dd7e82bb6bee24274ba')

package() {
    install -Dm755 "$srcdir/mux-media" "$pkgdir/usr/bin/mux-media"
}
