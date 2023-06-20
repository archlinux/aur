# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=tear-pages
pkgver=0.4.1
pkgrel=1
pkgdesc="Simple script to remove the first page of a PDF"
arch=('any')
url="https://github.com/sciunto/tear-pages"
license=('GPL3')
depends=('python' 'python-pypdf2')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/t/tear-pages/tear-pages-${pkgver}.tar.gz)
sha256sums=('9810fba3f91bb0b12dc1daf6a89e46563eb0cf09fddba365c2f4baf102041f5d')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
