# Maintainer: Yardena Cohen <yardenack at gmail com>
# Based on a PKGBUILD by: Rich Li <rich at dranek com>

pkgname=python-pyshp
_pkgname=pyshp
pkgver=1.2.3
pkgrel=1
pkgdesc="Python read/write support for ESRI Shapefile format"
arch=('any')
url="https://pypi.python.org/pypi/pyshp"
license=('MIT')
depends=('python' 'python-setuptools')
options=('!emptydirs')
source=(https://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('e18cc19659dadc5ddaa891eb780a6958094da0cf105a1efe0f67e75b4fa1cdf9')

package() {
	 cd "$srcdir/$_pkgname-$pkgver"
	 python setup.py install --root="$pkgdir" --optimize=1
}
