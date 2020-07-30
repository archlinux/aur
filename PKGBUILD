# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-portolan
pkgver=1.0.1
pkgrel=1
pkgdesc='Convert between compass points and degrees'
arch=('any')
url="https://github.com/fitnr/portolan"
license=('GPL3')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fitnr/portolan/archive/v${pkgver}.tar.gz")
sha256sums=('ce9d81b60ab705f1e305d3d691883d740bf35079acea75ea448927915b220d4c')

package() {
  cd "portolan-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}