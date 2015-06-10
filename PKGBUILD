# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=tear-pages
pkgver=0.2
pkgrel=1
pkgdesc="Simple script to remove the first page of a PDF"
arch=('any')
url="https://github.com/sciunto/tear-pages"
license=('GPL3')
depends=('python' 'python-pypdf2')
makedepends=('python-setuptools')
source=(http://source.sciunto.org/tear-pages/tear-pages-${pkgver}.tar.bz2)

package() {
  cd "$srcdir"
  python setup.py install --root="${pkgdir}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:ts=2:sw=2:et:
md5sums=('173146e3667808140340ebd4d4635ea5')
