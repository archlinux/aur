# Maintainer: Yardena Cohen <yardenack at gmail com>
# Based on a PKGBUILD by: Rich Li <rich at dranek com>

pkgname=python-pyshp
_pkgname=pyshp
pkgver=1.2.10
pkgrel=1
pkgdesc="Python read/write support for ESRI Shapefile format"
arch=('any')
url="https://github.com/GeospatialPython/${_pkgname}"
license=('MIT')
depends=('python' 'python-setuptools')
options=('!emptydirs')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('82b1eb3164f9d0f17941ed5e50ca7a3b2070abfdc5fcf4b357e1d5c9a3e98f791de92bb7fd9daf50ebf8b59d487914b80296187d22d1b4213b821c29dee76a1a')

package() {
	 cd "$srcdir/$_pkgname-$pkgver"
	 python setup.py install --root="$pkgdir" --optimize=1
}
