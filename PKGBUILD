# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=python2-freetype-py
pkgver=0.5.1
pkgrel=1
pkgdesc="FreeType Python bindings"
arch=('any')
url="https://github.com/rougier/freetype-py/"
license=('BSD')
groups=()
depends=('python2')
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/f/freetype-py/freetype-py-${pkgver}.tar.gz")
sha1sums=('c550909b4aa9ec407cf5130019d93e415059ddf7')

package() {
  cd "$srcdir/freetype-py-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et ft=sh:
