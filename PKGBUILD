# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-oslo-versionedobjects-liberty"
pkgver=0.4.0
pkgrel=1
pkgdesc="Oslo Versioned Objects library"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/oslo.versionedobjects/"
license=("Apache")

depends=("python2"
	 "python2-six")

makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/o/oslo.versionedobjects/oslo.versionedobjects-${pkgver}.tar.gz")
md5sums=('662485aac5c5854dccf9d58b9c05fecb')

build() {
  cd "${srcdir}/oslo.versionedobjects-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/oslo.versionedobjects-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
