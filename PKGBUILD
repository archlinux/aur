# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-overpass
pkgver=0.4.0
pkgrel=1
pkgdesc="Python wrapper for the OpenStreetMap Overpass API"
url="https://github.com/mvexel/overpass-api-python-wrapper"
depends=('python' )
license=('Apache')
arch=('any')
source=('https://pypi.python.org/packages/8a/09/950a3c969e7805170659d763378b516b9edb3db02c34e43466f5fbc6c20c/overpass-0.4.0.tar.gz')
md5sums=('af9d96e1fc81e750ddfcb869f6f66b25')

build() {
  cd $srcdir/overpass-0.4.0
  python setup.py build
}

package() {
  cd $srcdir/overpass-0.4.0
  python setup.py install --root="$pkgdir" --optimize=1 
}
