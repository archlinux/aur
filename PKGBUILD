pkgname=python-anyqt
pkgver=0.0.14
pkgrel=1
pkgdesc="PyQt4/PyQt5 compatibility layer"
url="https://github.com/ales-erjavec/anyqt"
arch=(any)
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-pyqt5')
source=("https://pypi.io/packages/source/A/AnyQt/AnyQt-${pkgver}.tar.gz")
sha256sums=('bde437983498045c85e69fc9906508a6394a69d486c598c031e53d8933f10e9c')

build() {
    cd AnyQt-$pkgver
    python setup.py build
}

package() {
    cd AnyQt-$pkgver
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

# vim: set ts=4 sw=4 et:
