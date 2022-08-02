pkgname=python-anyqt
pkgver=0.2.0
pkgrel=1
pkgdesc="PyQt4/PyQt5 compatibility layer"
url="https://github.com/ales-erjavec/anyqt"
arch=(any)
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-pyqt5')
source=("https://pypi.io/packages/source/A/AnyQt/AnyQt-${pkgver}.tar.gz")
sha256sums=('4b9228b918a26df2fdcc61f135db548ad3c3036e5bc7e67ba8147e0b6683763b')

build() {
    cd AnyQt-$pkgver
    python setup.py build
}

package() {
    cd AnyQt-$pkgver
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

# vim: set ts=4 sw=4 et:
