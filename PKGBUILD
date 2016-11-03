# $Id: PKGBUILD 126549 2015-01-25 09:03:30Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

_dbname=cremona_ellcurve
pkgname=sage-data-$_dbname
pkgver=20161017
pkgrel=1
pkgdesc="John Cremona's large database of elliptic curves for SageMath"
arch=(any)
url="http://www.sagemath.org"
license=(GPL)
depends=(sagemath)
makedepends=()
#source=("http://www.sagemath.org/packages/upstream/database_$_dbname/database_$_dbname-$pkgver.tar.bz2")
source=("http://mirrors.mit.edu/sage/spkg/upstream/database_$_dbname/database_$_dbname-$pkgver.tar.bz2")
md5sums=('09fc9b5f5569597fc39622b2dabc10d9')

package() {
  cd src
  mkdir -p "$pkgdir"/usr/share/cremona
  install -m644 * "$pkgdir"/usr/share/cremona
}
