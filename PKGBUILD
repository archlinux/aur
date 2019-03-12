# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: Francois Garillot <francois[@]garillot.net>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Malkov Fyodor aka krox <iksut@yandex.ru>

pkgname=python-djvulibre
pkgver=0.8.4
pkgrel=1
pkgdesc="A set of Python bindings for the DjVuLibre library"
arch=('i686' 'x86_64')
url="http://jwilk.net/software/python-djvulibre"
license=('GPL2')
depends=('djvulibre' 'python')
makedepends=('cython')
source=("https://pypi.io/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6d7c84efa9ad7efc5fa6d94b7a6ca8201326cb95c7e62d6da566acfc115a647d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
}
