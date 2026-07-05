# Maintainer: Lazaro Millares <lazaro.millares@gmail.com>
pkgname=goyt-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="YouTube Music CLI Player in Go (precompiled binary)"
arch=('x86_64')
url="https://github.com/lazaroMB/goyt"
license=('MIT')
depends=('mpv' 'yt-dlp')
provides=('goyt')
conflicts=('goyt')
source_x86_64=("$pkgname-$pkgver-linux-amd64::$url/releases/download/v$pkgver/goyt-linux-amd64")
sha256sums_x86_64=('186ad705fe0e8f09f7de117f02b4a38b5f7ff81e22e1aea45cd6e4bb46c74900')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-linux-amd64" "$pkgdir/usr/bin/goyt"
}
