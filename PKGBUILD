# Maintainer: Simon Legner <Simon.Legner@gmail.com
pkgname=broot-bin
pkgver=0.11.3
pkgrel=1
pkgdesc="Fuzzy Search + tree + cd"
arch=(x86_64)
url="https://github.com/Canop/broot"
license=('MIT')
source=("$pkgname-$pkgver::https://github.com/Canop/broot/releases/download/v$pkgver/broot")
sha256sums=('9b0951e37a1da8fe9c834b07d2377f024883dd93372d52193331674ec4412203')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/broot"
}
