# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=python2-freetype-py
_name=freetype-py
pkgver=1.2.1
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
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha1sums=('cac7473457718ffd91244ba127beceff391ab0c9')
package() {
  cd "$srcdir/freetype-py-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et ft=sh:
