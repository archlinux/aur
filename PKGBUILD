# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: MCMic <come@chilliet.eu>
# Generated with pip2pkgbuild

pkgbase='python-bson'
pkgname=('python-bson')
_module='bson'
pkgver='0.5.10'
pkgrel=2
pkgdesc="BSON codec for Python"
url="https://github.com/py-bson/bson"
depends=('python')
makedepends=('python-setuptools')
conflicts=('python-pymongo')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('d6511b2ab051139a9123c184de1a04227262173ad593429d21e443d6462d6590')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
