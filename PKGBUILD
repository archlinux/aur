# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-pyminiracer
pkgver=0.4.0
pkgrel=1
pkgdesc='Python Mini Racer'
arch=('any')
url="https://github.com/sqreen/PyMiniRacer"
license=('ISC')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sqreen/PyMiniRacer/archive/v${pkgver}.zip")
sha256sums=('1142ff18846a37342a248169804c1d52079ac9bc4305fd64cfeab4ceaafb1493')

package() {
  cd "PyMiniRacer-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
