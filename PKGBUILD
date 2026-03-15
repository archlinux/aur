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
sha256sums=('72eb0214ae7e7ce66e815669ba3c94c269db68c7b43e8f64424084a0939f9770')
options=('!debug')

package() {
    cd "$srcdir"
    install -Dm755 spotifydl "$pkgdir/usr/bin/spotifydl"
}