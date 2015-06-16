# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-isbnlib
pkgver=3.5.6
pkgrel=1
pkgdesc="Extract, clean, transform, hyphenate and metadata for ISBNs"
arch=('any')
url="https://pypi.python.org/pypi/isbnlib"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/i/isbnlib/isbnlib-$pkgver.tar.gz)
sha256sums=('6e7115f250624b7b5b799743fe9dea329f3d029f13f6a473237b47a16616360d')

package(){
  cd "$srcdir/isbnlib-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
