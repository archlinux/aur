# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python2-isbntools
pkgver=3.3.8
pkgrel=1
pkgdesc="Extract, clean, transform, hyphenate and metadata for ISBNs"
arch=('any')
url="https://pypi.python.org/pypi/isbntools"
license=('LGPL3')
depends=('python2')
makedepends=('python2-setuptools')
source=(https://pypi.python.org/packages/source/i/isbntools/isbntools-$pkgver.tar.gz)

build() {
  cd "$srcdir/isbntools-$pkgver"
  python2 setup.py build
}

package(){
  cd "$srcdir/isbntools-$pkgver"
  python2 setup.py install --root="${pkgdir}"
}

# vim:ts=2:sw=2:et:
md5sums=('29992a891b014b539fc58a64f630a309')
