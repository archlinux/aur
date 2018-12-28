#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=bloscpack
pkgver=0.16.0
pkgrel=1
pkgdesc='command line interface to and serialization format for Blosc.'
arch=(any)
url='https://github.com/Blosc/bloscpack'
license=(MIT)
depends=(python-blosc python-numpy python-six)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Blosc/bloscpack/archive/v${pkgver}.tar.gz)
sha256sums=('3aac97ec022a78aa3229f25193c28d41ba36659b00a50cd9c89c281d79a10723')

build() {
    cd ${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}"
}
