# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Former Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=python2-freetype-py
_name=freetype-py
pkgver=2.0
pkgrel=1
pkgdesc="FreeType Python bindings"
arch=('any')
url="https://github.com/rougier/freetype-py/"
license=('BSD')
groups=()
depends=('python2')
makedepends=('python2-setuptools')
options=(!emptydirs)
install=
source=("https://github.com/rougier/${_name}/archive/${pkgver}.tar.gz")
sha1sums=('b3518e5de5765da1c975e66d9e78e1754baaa275')
package() {
  cd "$srcdir/freetype-py-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et ft=sh:
