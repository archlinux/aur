# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python2-funcsigs
pkgver=0.4
pkgrel=1
pkgdesc="Python function signatures from PEP362 for Python 2.6 and 2.7"
arch=('any')
url="http://funcsigs.readthedocs.org"
depends=('python2')
makedepends=('python2-setuptools')
license=('Apache')
options=(!libtool)
source=(https://pypi.python.org/packages/source/f/funcsigs/funcsigs-${pkgver}.tar.gz)
md5sums=('fb1d031f284233e09701f6db1281c2a5')

build() {
  cd "${srcdir}"/funcsigs-${pkgver}

  python2 setup.py build
}

package() {
  cd "${srcdir}"/funcsigs-${pkgver}

  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

