# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-xstatic"
pkgver=1.0.1
pkgrel=1
pkgdesc="XStatic base package with minimal support code"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/XStatic"
license=("MIT")
depends=("python2")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/X/XStatic/XStatic-${pkgver}.tar.gz")
md5sums=('7064b5ea7fd1ee990e0ae0538301d9bc')

build() {
  cd "${srcdir}/XStatic-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/XStatic-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
