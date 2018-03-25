# Maintainer: Yardena Cohen <yardenack at gmail com>
# Based on a PKGBUILD by: Rich Li <rich at dranek com>

pkgname=python2-pyshp
_pkgname=pyshp
pkgver=1.2.12
pkgrel=1
pkgdesc="Python read/write support for ESRI Shapefile format"
arch=('any')
url="https://github.com/GeospatialPython/${_pkgname}"
license=('MIT')
depends=('python' 'python-setuptools')
options=('!emptydirs')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('94a3b056eed3f9a1bb527a714a57c9528df0f75078a830559438207f33b78435f69ed2d2daeef1b3128ffab5240a48929cb6177ae5850ea01a42274fdf3fc267')

package() {
	 cd "$srcdir/$_pkgname-$pkgver"
	 python2 setup.py install --root="$pkgdir" --optimize=1
}
