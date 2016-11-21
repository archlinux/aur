# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=luabcrypt
pkgver="2.1_3"
pkgrel=1
pkgdesc="A Lua wrapper for bcrypt"
arch=('i686' 'x86_64')
url="http://github.com/mikejsavage/lua-bcrypt"
license=('MIT')
depends=('lua')
makedepends=('luarocks')
source=("https://luarocks.org/manifests/mikejsavage/${pkgname/lua/}-${pkgver/_/-}.src.rock")

package() {
  luarocks --to="$pkgdir/usr" install --deps-mode=none "$srcdir/${pkgname/lua/}-${pkgver/_/-}.src.rock"
  rm -Rf "$pkgdir/usr/lib/luarocks"
}

sha256sums=('b5c6867abf140c3b016d72fb375861cd893cb67b28b85014a9d1629a60eb3cb2')
