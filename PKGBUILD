# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-isbnlib
pkgver=3.5.7
pkgrel=1
pkgdesc="Extract, clean, transform, hyphenate and metadata for ISBNs"
arch=('any')
url="https://pypi.python.org/pypi/isbnlib"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/i/isbnlib/isbnlib-$pkgver.tar.gz)
sha256sums=('5c3287bbebece3183e099f15741ca39cb19a0f4b20a29301ca892d3df775d790')

package(){
  cd "$srcdir/isbnlib-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
