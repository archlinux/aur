# Maintainer: Joshua Leahy <jleahy@gmail.com>

pkgname=python-freetype-py
pkgver=1.2.1
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
source=("https://github.com/rougier/freetype-py/archive/${pkgver}.tar.gz")
sha1sums=('ab2a8c09e1f34aa262f3a5bdcce2d692bc086155')

package() {
  cd "$srcdir/freetype-py-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et ft=sh:
