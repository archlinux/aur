# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname="python2-wrapt"
pkgver=1.12.1
pkgrel=1
pkgdesc="A Python module for decorators, wrappers and monkey patching."
arch=("any")
url="https://pypi.python.org/pypi/wrapt"
license=("BSD")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/w/wrapt/wrapt-${pkgver}.tar.gz")
sha256sums=('b62ffa81fb85f4332a4f609cab4ac40709470da05643a082ec1eb88e6d9b97d7')

build() {
  cd "${srcdir}/wrapt-${pkgver}/"
  python2 setup.py build
}

package_python2-wrapt() {
  cd "${srcdir}/wrapt-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
