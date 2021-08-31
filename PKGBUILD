# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=tor-util
pkgver=0.1.1
pkgrel=1
pkgdesc="Utility for controling TOR via the API"
url="https://github.com/GIJack/tor-util"
arch=('any')
license=('GPL3')
depends=('python' 'python-stem' 'python-pyqt5')
makedepends=('python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/GIJack/tor-util/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6c7a1c5773134dfdf1cbd61e8ab3b8f94b2538f8eaf1987945dc5b4608269142')

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
