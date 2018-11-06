# Maintainer: Yardena Cohen <yardenack at gmail com>
# Based on a PKGBUILD by: Rich Li <rich at dranek com>

pkgname=python-pyshp
_pkgname=pyshp
pkgver=2.0.0
pkgrel=1
pkgdesc="Python read/write support for ESRI Shapefile format"
arch=('any')
url="https://github.com/GeospatialPython/${_pkgname}"
license=('MIT')
depends=('python' 'python-setuptools')
options=('!emptydirs')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('ac59c1a37749affb9852df88eed9984999ba770a6127e7d841f8581458362f68715712cfbb0eb4149f6ec9e224c2fe154694d0247495900dac507ed90803a01f')

package() {
	 cd "$srcdir/$_pkgname-$pkgver"
	 python setup.py install --root="$pkgdir" --optimize=1
}
