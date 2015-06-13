# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=tear-pages
pkgver=0.2
pkgrel=2
pkgdesc="Simple script to remove the first page of a PDF"
arch=('any')
url="https://github.com/sciunto/tear-pages"
license=('GPL3')
depends=('python' 'python-pypdf2')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/t/tear-pages/tear-pages-${pkgver}.tar.gz)
sha256sums=('3bd439c8117d8ad9240b0eaef2b6c4adbd2e31aa3610d45cdaea8fb03bcff6c2')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
