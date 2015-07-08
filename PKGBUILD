# Maintainer: Connor Behan <connor.behan@gmail.com>

pkgname=python2-apipkg
_shortname=apipkg
pkgver=1.4
pkgrel=1
pkgdesc="Python 2 module for namespace control and lazy-import mechanism"
arch=(any)
url="http://pypi.python.org/pypi/apipkg"
license=('MIT') 
depends=('python2') 
source=(http://pypi.python.org/packages/source/a/$_shortname/$_shortname-$pkgver.tar.gz)

package() {
  cd $srcdir/$_shortname-$pkgver
  python2 setup.py install --root="$pkgdir"
}
md5sums=('17e5668601a2322aff41548cb957e7c8')
