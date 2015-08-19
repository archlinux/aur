# Maintainer: Marco Kundt <mrckndt@gmail.com>

pkgname=python-kppy
_pkgname=kppy
pkgver=1.4.2
pkgrel=2
pkgdesc="A Python-module to provide an API to KeePass 1.x files commonly used by KeePassX."
arch=('any')
url="https://github.com/raymontag/kppy"
license=('GPL')
depends=('python-crypto')
makedepends=('python' 'python-crypto')
source=(https://github.com/raymontag/kppy/archive/${pkgver}.tar.gz)
sha256sums=('f0824abad31307db5a296527f1f75a57f3e602541c6e6de7eb86a0a784f3991b')

package() {
    cd ${_pkgname}-${pkgver}

    python setup.py install --root=${pkgdir} --optimize=1
}
