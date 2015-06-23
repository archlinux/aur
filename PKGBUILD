# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
pkgname=python-shapely
pkgver=1.5.9
pkgrel=1
pkgdesc="Manipulation and analysis of geometric objects in the Cartesian plane"
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/Shapely"
license=('BSD')
depends=('python>=3.0' 'geos>=3.3')
source=("https://pypi.python.org/packages/source/S/Shapely/Shapely-${pkgver}.tar.gz")
md5sums=('b502824b154a49fbb8f33703d71557dd')
 
package() {
  cd "$srcdir"/Shapely-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
 
# vim:set ts=2 sw=2 et:
