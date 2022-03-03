# Maintainer: Sasha Moak <sasha dot moak at gmail dot com>

pkgname=mopidy-musicbox
pkgver=3.1.0
pkgrel=3
pkgdesc="Web Client for Mopidy Music Server and the Pi MusicBox"
arch=('any')
url="https://github.com/pimusicbox/mopidy-musicbox-webclient"
license=('Apache')
depends=('python' 'mopidy>=3.0')
makedepends=('python' 'python-setuptools')
source=("https://github.com/pimusicbox/${pkgname}-webclient/archive/v${pkgver}.tar.gz")
sha256sums=('7c9dc906923280809e38a326a539a82ab5eaeb9c3d526b12fefbc93efac0be96')

package() {
  cd "${srcdir}/${pkgname}-webclient-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
