#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=bloscpack
pkgver=0.14.0
pkgrel=1
pkgdesc='command line interface to and serialization format for Blosc.'
arch=(any)
url='https://github.com/Blosc/bloscpack'
license=(MIT)
depends=(python-blosc python-numpy python-six)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Blosc/bloscpack/archive/v${pkgver}.tar.gz)
sha256sums=('5123e9ed005760abde5fdedbe06e48bf6ba8ebb9a8c9b7d71a9313ef8ab71c8c')

build() {
    cd ${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}"
}
