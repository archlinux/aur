# Maintainer: Ellis Kenyo <me at elken dot dev>

pkgname=firn-bin
pkgver=0.0.21
pkgrel=1
pkgdesc="Static site generator for org-mode"
arch=('x86_64')
url="https://github.com/theiceshelf/firn"
license=('EPL')
source=($pkgname-$pkgver::https://github.com/theiceshelf/firn/releases/download/v$pkgver/firn-linux-x86_64)
md5sums=('2aaa7821e6ad54c10db164121bea79ed')

package() {
  install -d "$pkgdir/usr/bin"
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/firn"
}
