# Maintainer: M0Rf30
pkgname=python2-bleach
pkgver=1.4.2
pkgrel=1
pkgdesc="An easy whitelist-based HTML-sanitizing tool"
arch=('any')
license=('Apache')
url="http://pypi.python.org/pypi/bleach"
depends=('python2-html5lib')
makedepends=('python2-setuptools')
source=("http://pypi.python.org/packages/source/b/bleach/bleach-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/bleach-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/bleach-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

md5sums=('6a8f4d8afed000e2aea14c3aa02a1ea9')
