# Maintainer: Hamza Gbada <hamza.gbada@gmail.com>

pkgname=greatest-poetic-line
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple script that prints the greatest poetic line in all arabic history"
arch=('any')
license=('MIT')
depends=()
source=("line.sh")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/line.sh" "$pkgdir/usr/bin/great-line"
}
