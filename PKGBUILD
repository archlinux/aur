# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname="python2-wrapt"
pkgver=1.10.4
pkgrel=1
pkgdesc="A Python module for decorators, wrappers and monkey patching."
arch=("any")
url="https://pypi.python.org/pypi/wrapt"
license=("BSD")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/w/wrapt/wrapt-${pkgver}.tar.gz")
sha256sums=('a657129f910f9155ea0a567ef442016bff6a0b4ace8a4c5e7fbf91e0eb13d7de')

build() {
  cd "${srcdir}/wrapt-${pkgver}/"
  python2 setup.py build
}

package_python2-wrapt() {
  cd "${srcdir}/wrapt-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
