# $Id: PKGBUILD 195814 2016-11-14 17:30:00Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributpr: Roland Schaeuble <rschaeuble@gmx.ch>

pkgname=pycddb
pkgver=0.1.4
pkgrel=1
pkgdesc="CDDB-Server access from Python"
arch=('any')
license=('GPL')
url="http://pycddb.sourceforge.net"
depends=('python2')
source=("https://downloads.sourceforge.net/pycddb/pycddb-$pkgver.src.tar.gz")
sha256sums=('c6afdb63b21dcd5af69369d36a4c6d7ddd7ef7b8f61cc98c95b6b79ea015afbf')

package() {
  cd "$srcdir"/pycddb/src
  python2 setup.py install --root="$pkgdir"/
}
