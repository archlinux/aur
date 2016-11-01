# Maintainer: Antonio Rojas <arojas@archlinux.org>

_dbname=jones_numfield
pkgname=sage-data-$_dbname
pkgver=4
pkgrel=1
pkgdesc="A table of number fields with bounded ramification and degree ≤6"
arch=(any)
url="http://www.sagemath.org"
license=(GPL)
depends=()
makedepends=()
source=("http://mirrors.mit.edu/sage/spkg/upstream/database_$_dbname/database_$_dbname-$pkgver.tar.gz")
md5sums=('a8da4f207235a1de980a23a06e1e6d76')

package() {
  mkdir -p "$pkgdir"/usr/share/jones

  cd database_$_dbname-$pkgver
  install -Dm644 jones.sobj "$pkgdir"/usr/share/jones
}
