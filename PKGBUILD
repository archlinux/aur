# Maintainer: Lazaro Millares <lazaro.millares@gmail.com>
pkgname=goyt-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="YouTube Music CLI Player in Go (precompiled binary)"
arch=('x86_64')
url="https://github.com/lazaroMB/goyt"
license=('MIT')
depends=('mpv' 'yt-dlp')
provides=('goyt')
conflicts=('goyt')
source_x86_64=("$pkgname-$pkgver-linux-amd64::$url/releases/download/v$pkgver/goyt-linux-amd64")
sha256sums_x86_64=('7b5f03901b42d1a04368e27ff7c4a6608cee3aa33d3f6ced84f31c5ef428a1f1')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-linux-amd64" "$pkgdir/usr/bin/goyt"
}
