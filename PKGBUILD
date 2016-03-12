# Maintainer: Joshua Leahy <jleahy@gmail.com>

pkgname=python-freetype-py
pkgver=1.0.2
pkgrel=1
pkgdesc="FreeType Python bindings"
arch=('any')
url="https://github.com/rougier/freetype-py/"
license=('BSD')
groups=()
depends=('python' 'freetype2')
makedepends=('python-setuptools')
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/f/freetype-py/freetype-py-${pkgver}.tar.gz")
sha1sums=('33bfea26681827a6ab09a95adfa52194c9b4810f')

package() {
  cd "$srcdir/freetype-py-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et ft=sh:
