# Maintainer: Lazaro Millares <lazaro.millares@gmail.com>
pkgname=goyt-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="YouTube Music CLI Player in Go (precompiled binary)"
arch=('x86_64')
url="https://github.com/lazaroMB/goyt"
license=('MIT')
depends=('mpv' 'yt-dlp')
provides=('goyt')
conflicts=('goyt')
source_x86_64=("$pkgname-$pkgver-linux-amd64::$url/releases/download/v$pkgver/goyt-linux-amd64")
sha256sums_x86_64=('48848bd4d57d8822533b27d53611659f70c831db34422db0fe227093da56c2c6')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-linux-amd64" "$pkgdir/usr/bin/goyt"
}
