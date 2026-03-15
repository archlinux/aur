pkgname=spotifydl
pkgver=1.0.0
pkgrel=1
pkgdesc="Spotifydl is a simple CLI tool for downloading Spotify music with metadata intact."
arch=('x86_64')
license=('GPL3')
depends=("ffmpeg" "yt-dlp")
makedepends=()
url="https://github.com/bjn7/spotifydl"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bjn7/spotifydl/releases/download/v$pkgver/spotifydl-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('529b00673883e995b9e3aba33c63bc064cd9e4c47cf880580f2b924d98cb1bf9')
options=('!debug')

package() {
    cd "$srcdir"
    install -Dm755 spotifydl "$pkgdir/usr/bin/spotifydl"
}