# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
pkgname=mbutil
pkgver=0.3.0
pkgrel=1
pkgdesc="An importer and exporter for MBTiles"
arch=(any)
url="https://github.com/mapbox/mbutil"
license=('BSD')
depends=('python')
provides=("${pkgname}=${pkgver}")
conflicts=(${pkgname}-git)
source=("https://github.com/mapbox/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f18864469ca62d9671c4cf5b9277c1131b2147311488628c36e351f9757f0b3e')

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}/" --prefix=/usr --optimize=1
}
