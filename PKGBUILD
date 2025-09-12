# Maintainer:

_pkgname="cpp-peglib"
pkgname="$_pkgname"
pkgver=1.9.1
pkgrel=1
pkgdesc="A single file C++ header-only PEG (Parsing Expression Grammars) library"
url="https://github.com/yhirose/cpp-peglib"
license=('MIT')
arch=('any')

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/v$pkgver.$_pkgext")
sha256sums=('f57aa0f14372cbb772af29e3a4549a8033ea07eb25c39949cba6178e0e2ba9cc')

package() {
  cd "$_pkgsrc"
  install -Dm644 peglib.h -t "$pkgdir/usr/include/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
