# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-overpass
pkgver=0.7.0
pkgrel=1
pkgdesc="Python wrapper for the OpenStreetMap Overpass API"
url="https://github.com/mvexel/overpass-api-python-wrapper"
depends=('python' )
license=('Apache')
arch=('any')
source=("https://github.com/mvexel/overpass-api-python-wrapper/archive/${pkgver}.tar.gz")
md5sums=('3a073927b901f0afb51586e85ed6b014')

build() {
  cd "${srcdir}/overpass-api-python-wrapper-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/overpass-api-python-wrapper-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 
}
