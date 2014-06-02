# Maintainer: Yardena Cohen <yardenack at gmail com>
# Based on a PKGBUILD by: Rich Li <rich at dranek com>
pkgname=python-pyshp
_pkgname=pyshp
pkgver=1.2.1
pkgrel=1
pkgdesc="Python read/write support for ESRI Shapefile format"
arch=('any')
url="https://pypi.python.org/pypi/pyshp"
license=('MIT')
depends=('python' 'python-setuptools')
options=('!emptydirs')
source=(https://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('eb4a1999f7c7bd573f3c8920344f50bd86221114980f07f521858d23654a33b0')

package() {
	 cd "$srcdir/$_pkgname-$pkgver"
	 python setup.py install --root="$pkgdir" --optimize=1
}
