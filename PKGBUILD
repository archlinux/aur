# Maintainer: Storm Dragon <stormdragon2976@gmail.com> 

pkgname=python-pyttsx
pkgver=1.1
pkgrel=2
pkgdesc="cross platform text-to-speech interface"
arch=('any')
url="https://pypi.python.org/pypi/pyttsx"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/p/pyttsx/pyttsx-${pkgver}.tar.gz")
md5sums=('9426e15cc34e2d38f70b7bc61bd326dc')

build() {
  cd "${srcdir}/pyttsx-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/pyttsx-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
