# Maintainer: Troy C < rstrox -ta yahoo -tod com >

pkgname=("python-wrapt" 'python2-wrapt')
pkgver=1.10.5
pkgrel=1
pkgdesc="A Python module for decorators, wrappers and monkey patching."
arch=("any")
url="https://pypi.python.org/pypi/wrapt"
license=("BSD")
makedepends=("python2-setuptools" "gcc")
source=("https://pypi.python.org/packages/source/w/wrapt/wrapt-${pkgver}.tar.gz")
sha256sums=('99cbb4e3a3ea964df0cb1437261fc1198616ec872e7b501622f3f7f92fcd0833')

build() {
  cd "${srcdir}/wrapt-${pkgver}/"
  python setup.py build
  python2 setup.py build
}

package_python-wrapt() {
  cd "${srcdir}/wrapt-${pkgver}/"
  python setup.py install --root="${pkgdir}/"
}

package_python2-wrapt() {
  cd "${srcdir}/wrapt-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/"
}
