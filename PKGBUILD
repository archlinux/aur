# $Id: PKGBUILD 126373 2015-01-21 20:31:43Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

_dbname=kohel
pkgname=sage-data-$_dbname
pkgver=20160724
pkgrel=2
pkgdesc="Database of modular and Hilbert polynomials for SageMath"
arch=(any)
url="http://www.sagemath.org"
license=(GPL)
depends=()
makedepends=()
source=("http://mirrors.mit.edu/sage/spkg/upstream/database_$_dbname/database_$_dbname-$pkgver.tar.gz")
md5sums=('5253b28e0a82f1fb88dc5cabb95ae578')

package() {
  mkdir -p "$pkgdir"/usr/share/kohel

  cd database_$_dbname
  cp -r PolMod PolHeeg "$pkgdir"/usr/share/kohel
}
