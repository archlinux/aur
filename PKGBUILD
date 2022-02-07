# Maintainer: Ellis Kenyo <me at elken dot dev>

pkgname=firn-bin
pkgver=0.0.16
pkgrel=1
pkgdesc="Static site generator for org-mode"
arch=('x86_64')
url="https://github.com/theiceshelf/firn"
license=('EPL')
source=($pkgname-$pkgver::https://github.com/theiceshelf/firn/releases/download/v$pkgver/firn-x86_64-unknown-linux-gnu.zip)
md5sums=('fcd6c8b1e0680dcac8113e3e5f2435a2')

package() {
  install -d "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/firn" "$pkgdir/usr/bin/"
}
