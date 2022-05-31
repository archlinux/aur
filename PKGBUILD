# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=tor-util
pkgver=0.1.3
pkgrel=1
pkgdesc="Utility for controling TOR via the API"
url="https://github.com/GIJack/tor-util"
arch=('any')
license=('GPL3')
depends=('python' 'python-stem' 'python-pyqt5')
makedepends=('python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/GIJack/tor-util/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fdfb6a9973b4496d409a54634551b04887bb45b275033917a839dc85d440bbf4')

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
