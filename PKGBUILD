# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-isbntools
pkgver=4.2.5
pkgrel=1
pkgdesc="Extract, clean, transform, hyphenate and metadata for ISBNs"
arch=('any')
url="https://pypi.python.org/pypi/isbntools"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/i/isbntools/isbntools-$pkgver.tar.gz)
sha256sums=('7a89799193fc48da2cefbcb899f87d131333c6fb7919a978c268e4a9d29b172b')

package(){
  cd "$srcdir/isbntools-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
