# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=tear-pages
pkgver=0.4.0
pkgrel=1
pkgdesc="Simple script to remove the first page of a PDF"
arch=('any')
url="https://github.com/sciunto/tear-pages"
license=('GPL3')
depends=('python' 'python-pypdf2')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/t/tear-pages/tear-pages-${pkgver}.tar.gz)
sha256sums=('e3a9c072de96405732b20297ea044db129305968579997a232922628ae4c663b')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
