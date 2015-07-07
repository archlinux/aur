# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-bitarray
pkgver=0.8.1
pkgrel=1
pkgdesc="Efficient arrays of booleans for Python"
arch=('i686' 'x86_64')
url="https://github.com/ilanschnell/bitarray"
license=('PSF')
depends=('python2')
makedepends=('python2-distribute')
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/b/bitarray/bitarray-${pkgver}.tar.gz)
md5sums=('3825184f54f4d93508a28031b4c65d3b')

build() {
  cd "$srcdir"/bitarray-$pkgver
  python2 setup.py build
}

package() {
  cd "$srcdir"/bitarray-$pkgver
  python2 setup.py install --root="$pkgdir"/ --optimize=1
}

