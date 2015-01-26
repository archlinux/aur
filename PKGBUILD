# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=python2-freetype-py
pkgver=1.0.1
pkgrel=2
pkgdesc="FreeType Python bindings"
arch=('any')
url="https://github.com/rougier/freetype-py/"
license=('BSD')
groups=()
depends=('python2')
makedepends=('python2-setuptools')
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/f/freetype-py/freetype-py-${pkgver}.tar.gz")
sha1sums=('8b83cab2bd42706c3e01c6bd2bf7dc1543f577d1')

package() {
  cd "$srcdir/freetype-py-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et ft=sh:
