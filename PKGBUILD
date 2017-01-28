# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-isbntools
pkgver=4.3.3
pkgrel=1
pkgdesc="Extract, clean, transform, hyphenate and metadata for ISBNs"
arch=('any')
url="https://pypi.python.org/pypi/isbntools"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/48/d1/fd06df5d88e040b7b1cbe6c09c880decb205445d60c6de43768ef028c590/isbntools-$pkgver.tar.gz)
sha256sums=('f6a171be9f15b886ef4afb0fe09fa7c34c7ae1c6ff28d253912972c4fad5387d')

package(){
  cd "$srcdir/isbntools-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
