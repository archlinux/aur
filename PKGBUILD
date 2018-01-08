# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-overpass
pkgver=0.5.6
pkgrel=1
pkgdesc="Python wrapper for the OpenStreetMap Overpass API"
url="https://github.com/mvexel/overpass-api-python-wrapper"
depends=('python' )
license=('Apache')
arch=('any')
source=("https://pypi.python.org/packages/60/9d/c88bae624db986d03043fa42fc9a402837d17dbdd06f8ffcf1c17b2635ff/overpass-${pkgver}.tar.gz")
md5sums=('b68a0d0211a85d673329679317108a89')

build() {
  cd $srcdir/overpass-0.4.0
  python setup.py build
}

package() {
  cd $srcdir/overpass-0.4.0
  python setup.py install --root="$pkgdir" --optimize=1 
}
