# Contributor: Johannes Dewender arch at JonnyJD dot net

pkgname=python2-pymetrics
_pkgname=pymetrics
pkgver=0.8.1
pkgrel=1
pkgdesc="produces metrics for Python programs"
arch=(any)
url="http://pymetrics.sourceforge.net/"
license=('GPL2')
depends=('python2')
conflicts=('python-pymetrics<=0.8.1')
replaces=('python-pymetrics<=0.8.1')
options=(!emptydirs)
source=(http://downloads.sourceforge.net/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('2413ea3d414e8a2b88b4a3d2aa32d835')

build () {
	  cd $srcdir/$_pkgname-$pkgver
	  python2 setup.py build
}

package () {
	  cd $srcdir/$_pkgname-$pkgver
	  python2 setup.py install --skip-build --root=$pkgdir/ --optimize=1
}
