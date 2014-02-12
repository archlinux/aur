# Maintainer: Yardena Cohen <yardenack at gmail com>
# Based on a PKGBUILD by: Rich Li <rich at dranek com>
pkgname=python-pyshp
_pkgname=pyshp
pkgver=1.2.0
pkgrel=1
pkgdesc="Python read/write support for ESRI Shapefile format"
arch=('any')
url="https://pypi.python.org/pypi/pyshp"
license=('MIT')
depends=('python' 'python-setuptools')
options=('!emptydirs')
source=(https://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('16e9a9b5caae5b69149c7be09415381b61af4f85f2087d08c0698c75e70000e7')

package() {
	 cd "$srcdir/$_pkgname-$pkgver"
	 python setup.py install --root="$pkgdir" --optimize=1
}
