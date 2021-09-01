# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=tor-util
pkgver=0.1.2
pkgrel=1
pkgdesc="Utility for controling TOR via the API"
url="https://github.com/GIJack/tor-util"
arch=('any')
license=('GPL3')
depends=('python' 'python-stem' 'python-pyqt5')
makedepends=('python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/GIJack/tor-util/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8d06c550ce2c2755a1832325eedfab13a1bc4fab9ff02ab459dad603849931be')

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
