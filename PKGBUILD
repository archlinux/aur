pkgname=python-anyqt
pkgver=0.1.1
pkgrel=1
pkgdesc="PyQt4/PyQt5 compatibility layer"
url="https://github.com/ales-erjavec/anyqt"
arch=(any)
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-pyqt5')
source=("https://pypi.io/packages/source/A/AnyQt/AnyQt-${pkgver}.tar.gz")
sha256sums=('271aee5fd216c14f044917ecc978fadf8b8cd89ecc61060689f0920e51c56276')

build() {
    cd AnyQt-$pkgver
    python setup.py build
}

package() {
    cd AnyQt-$pkgver
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

# vim: set ts=4 sw=4 et:
