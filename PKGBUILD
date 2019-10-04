# Maintainer: Antonio Rojas <arojas@archlinux.org>

_dbname=cremona_ellcurve
pkgname=sage-data-$_dbname
pkgver=20190911
pkgrel=1
pkgdesc="John Cremona's large database of elliptic curves for SageMath"
arch=(any)
url="http://www.sagemath.org"
license=(GPL)
depends=(sagemath)
makedepends=()
#source=("http://www.sagemath.org/packages/upstream/database_$_dbname/database_$_dbname-$pkgver.tar.bz2")
source=("http://mirrors.mit.edu/sage/spkg/upstream/database_$_dbname/database_$_dbname-$pkgver.tar.bz2")
sha256sums=('5d1d6aa35a95f9df123c87c1894791580d067444e1145bbd6ec20b4840f22053')

package() {
  cd src
  mkdir -p "$pkgdir"/usr/share/cremona
  install -m644 * "$pkgdir"/usr/share/cremona
}
