# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=python2-pycapnp
_pkgname=pycapnp
pkgver=0.5.6
pkgrel=1
pkgdesc="A cython wrapping of the C++ Cap'n Proto serialization library"
arch=(any)
url=https://pypi.python.org/pypi/pycapnp
license=(BSD)
depends=(python2 capnproto)
makedepends=(python2-setuptools cython2)
source=(http://pypi.python.org/packages/source/p/pycapnp/${_pkgname}-${pkgver}.tar.gz)
md5sums=(6f636c91e0291bd0b410c3f7b8076b76)

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py install --root=${pkgdir} --optimize=1
}
