# Maintainer: Dmitry Kharitonov <arch[at]nano-model[dot]com>
# Contributor: Francois Garillot <francois[@]garillot.net>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Malkov Fyodor aka krox <iksut@yandex.ru>

pkgname=python-djvulibre
pkgver=0.8.8
pkgrel=1
pkgdesc="A set of Python bindings for the DjVuLibre library"
arch=('i686' 'x86_64')
url="http://jwilk.net/software/python-djvulibre"
license=('GPL2')
depends=('djvulibre' 'python')
makedepends=('cython0')
source=("https://pypi.io/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ea8e4fe72d4f9e5c9ea64191ec99a75b35653263f3132e4d080f00ecd75d30ae')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
}
