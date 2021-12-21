pkgname=python-anyqt
pkgver=0.0.13
pkgrel=3
pkgdesc="PyQt4/PyQt5 compatibility layer"
url="https://github.com/ales-erjavec/anyqt"
arch=(any)
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-pyqt5')
source=("https://pypi.io/packages/source/A/AnyQt/AnyQt-${pkgver}.tar.gz")
sha256sums=('4ed02aa75264b714269dc32658e9dac74cc813f69859a3fe231d875b81f3f57c')

build() {
    cd AnyQt-$pkgver
    python setup.py build
}

package() {
    cd AnyQt-$pkgver
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

# vim: set ts=4 sw=4 et:
