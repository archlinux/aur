# Maintainer: Ivan Reutov <nujievik@gmail.com>

pkgname=mux-media-bin
pkgver=0.19.1
pkgrel=1
pkgdesc="CLI utility to mux (merge) video, audio, and subtitles"
arch=("x86_64" "i686")
url="https://github.com/nujievik/mux-media"
license=("MIT OR Apache-2.0")
options=("!debug")

source_x86_64=("$url/releases/download/v$pkgver/mux-media-Linux-x64.zip")
source_i686=("$url/releases/download/v$pkgver/mux-media-Linux-x32.zip")

sha256sums_x86_64=('573c36ee0f2d11a855689815b53f698a28aa41a31286068a1efd100c9f7b4893')
sha256sums_i686=('2e932adfb2cd1d536a65365268a697e38abd32b5559ad3d9d4ac6ee5006bcd09')

package() {
    install -Dm755 "$srcdir/mux-media" "$pkgdir/usr/bin/mux-media"
}
