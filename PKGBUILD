# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-nominatim
pkgver=0.1
pkgrel=2
pkgdesc="OSM Nominatim API Python module"
url="https://github.com/damianbraun/nominatim"
depends=('python' )
license=('Apache')
makedepends=('python-setuptools')
arch=('any')
source=('https://pypi.python.org/packages/59/f2/d47726f804208804f7f295e20a9d2ee4ea925fb6462481223464026bcf66/nominatim-0.1.tar.gz#md5=d586a7324703c7fc2b4f8ecaca83d11e')
md5sums=('d586a7324703c7fc2b4f8ecaca83d11e')

build() {
  cd $srcdir/nominatim-${pkgver}
  python setup.py build
}

package() {
  cd $srcdir/nominatim-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 
}
