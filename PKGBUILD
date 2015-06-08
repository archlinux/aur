# $Id: PKGBUILD 126549 2015-01-25 09:03:30Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

_dbname=cremona_ellcurve
pkgname=sage-data-$_dbname
pkgver=20150519
pkgrel=1
pkgdesc="John Cremona's large database of elliptic curves for Sage"
arch=('any')
url="http://www.sagemath.org"
license=('GPL')
depends=()
makedepends=()
#source=("http://www.sagemath.org/packages/upstream/database_$_dbname/database_$_dbname-$pkgver.tar.bz2")
source=("http://mirrors.mit.edu/sage/spkg/upstream/database_$_dbname/database_$_dbname-$pkgver.tar.bz2")
md5sums=('aac18192545c43e1c2e282169eecfa04')

package() {
  cd src
  mkdir -p "$pkgdir"/usr/share/sage/cremona
  install -m644 * "$pkgdir"/usr/share/sage/cremona
}
