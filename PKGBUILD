# Maintainer: Ellis Kenyo <me at elken dot dev>

pkgname=firn-bin
pkgver=0.0.12
pkgrel=1
pkgdesc="Static site generator for org-mode"
arch=('x86_64')
url="https://github.com/theiceshelf/firn"
license=('EPL')
source=($pkgname-$pkgver::https://github.com/theiceshelf/firn/releases/download/v$pkgver/firn-linux.zip)
md5sums=('58d968867ebb65805cdb01acf6d84eaf')

package() {
  install -d "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/firn" "$pkgdir/usr/bin/"
}
