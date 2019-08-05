# Maintainer: YaYPIXXO <viggo@lekdorf.com>
pkgname=evillimiter
pkgver=1.2.0
pkgrel=1
pkgdesc="Tool that limits bandwidth of devices on the same network without access."
arch=('x86_64')
url="https://github.com/bitbrute/evillimiter"
license=('MIT')
depends=('python3')
makedepends=('python-setuptools')
source=(
https://github.com/bitbrute/evillimiter/archive/v${pkgver}.tar.gz
)
sha256sums=(
'125ababe605cdc72a7167a65a63ce349269b6ec16ddb04195e46e783738343b6'
)

build () {

  cd "${srcdir}"/${pkgname}-${pkgver}
  python setup.py build

}

package () {

  cd "${srcdir}"/${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1

}
