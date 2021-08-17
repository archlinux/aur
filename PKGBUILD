# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=tor-util
#_pkgname=tor-util
pkgver=0.1
pkgrel=1
pkgdesc="Utility for controling TOR via the API"
url="https://github.com/GIJack/tor-util"
arch=('any')
license=('GPLv3')
depends=('python' 'python-stem' 'python-pyqt5')
makedepends=('python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/GIJack/tor-util/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('96e6b0b6b405c8121ccfdd00034a9f5e61637162c10e23c206942c516b2ecd27')

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
