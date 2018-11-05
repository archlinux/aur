#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=bloscpack
pkgver=0.15.0
pkgrel=1
pkgdesc='command line interface to and serialization format for Blosc.'
arch=(any)
url='https://github.com/Blosc/bloscpack'
license=(MIT)
depends=(python-blosc python-numpy python-six)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/Blosc/bloscpack/archive/v${pkgver}.tar.gz)
sha256sums=('ae9d286d151d05f00bcadf3bccf1477dc345ecdc4d4b06da5a790974b9989981')

build() {
    cd ${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}"
}
