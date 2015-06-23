# Maintainer: masutu Subric <masutu dot arch at gmail dot com>
# Contributor: Michal Marek <reqamst at gmail dot com>

pkgname=python-pyephem
pkgver=3.7.5.3
pkgrel=1
pkgdesc="PyEphem provides scientific-grade astronomical computations"
arch=('i686' 'x86_64')
url="http://rhodesmill.org/pyephem/"
license=('GPL' 'LGPL')
depends=('python')
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/e/ephem/ephem-$pkgver.tar.gz)
md5sums=('0e33905844e3be5c901c13e5a9c938a3')

package() {
	cd "$srcdir/ephem-$pkgver"
	python setup.py install --root=$pkgdir/ --optimize=1
}

