# Maintainer: Lazaro Millares <lazaro.millares@gmail.com>
pkgname=goyt-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="YouTube Music CLI Player in Go (precompiled binary)"
arch=('x86_64')
url="https://github.com/lazaroMB/goyt"
license=('MIT')
depends=('mpv' 'yt-dlp')
provides=('goyt')
conflicts=('goyt')
source_x86_64=("$pkgname-$pkgver-linux-amd64::$url/releases/download/v$pkgver/goyt-linux-amd64")
sha256sums_x86_64=('881814f921b40b8cced2f2fd6314a6f70f5494ccd41d669c3e417236d624a607')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-linux-amd64" "$pkgdir/usr/bin/goyt"
}
