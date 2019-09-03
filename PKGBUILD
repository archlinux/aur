# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=luabcrypt5.2
pkgver="2.1_4"
pkgrel=1
pkgdesc="A Lua wrapper for bcrypt"
arch=('i686' 'x86_64')
url="http://github.com/mikejsavage/lua-bcrypt"
license=('MIT')
depends=('lua52')
makedepends=('luarocks')
source=("https://luarocks.org/manifests/mikejsavage/bcrypt-${pkgver/_/-}.src.rock")

package() {
  luarocks --lua-version=5.2 --to="$pkgdir/usr" install --deps-mode=none "$srcdir/bcrypt-${pkgver/_/-}.src.rock"
  rm -Rf "$pkgdir/usr/lib/luarocks"
}

sha256sums=('0201396e62960e11f8506dccd52b620ad0bff91904a2454ce92900799d129b92')
