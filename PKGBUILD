# Maintainer: Yardena Cohen <yardenack at gmail com>
# Based on a PKGBUILD by: Rich Li <rich at dranek com>

pkgname=python-pyshp
_pkgname=pyshp
pkgver=2.1.0
pkgrel=1
pkgdesc="Python read/write support for ESRI Shapefile format"
arch=('any')
url="https://github.com/GeospatialPython/${_pkgname}"
license=('MIT')
depends=('python' 'python-setuptools')
options=('!emptydirs')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('20cbf023022a2bba4b7b05e53affedea31e4e72211968aad48ee868252c87f87e551a8ba274438e3871b31c4e3c56af2166a92a6c7bf3ffa2fe344722e4d8d0e')

package() {
	 cd "$srcdir/$_pkgname-$pkgver"
	 python setup.py install --root="$pkgdir" --optimize=1
}
