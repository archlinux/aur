# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-isbnlib
pkgver=3.3.8
pkgrel=1
pkgdesc="Extract, clean, transform, hyphenate and metadata for ISBNs"
arch=('any')
url="https://pypi.python.org/pypi/isbnlib"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/i/isbnlib/isbnlib-$pkgver.tar.gz)

build() {
  cd "$srcdir/isbnlib-$pkgver"
  python setup.py build
}

package(){
  cd "$srcdir/isbnlib-$pkgver"
  python setup.py install --root="${pkgdir}"
}

# vim:ts=2:sw=2:et:
md5sums=('ed20f5951e6975da9e0cf6b47a3f9b74')
