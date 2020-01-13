# Maintainer: crian <crian84 at gmail dot com>

pkgname=python-power
_module="Power"
pkgver=1.4
pkgrel=1
pkgdesc="Python module to get power and battery status."
arch=('any')
url="https://github.com/Kentzo/Power"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/Kentzo/Power/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
