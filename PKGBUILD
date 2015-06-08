# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=luabcrypt5.1
pkgver="1.5_1"
pkgrel=2
pkgdesc="A Lua wrapper for bcrypt"
arch=('i686' 'x86_64')
url="http://github.com/mikejsavage/lua-bcrypt"
license=('MIT')
depends=('lua51')
makedepends=('luarocks5.1')
source=("http://rocks.moonscript.org/manifests/luarocks/bcrypt-${pkgver/_/-}.src.rock")

package() {
  luarocks-5.1 --to="$pkgdir/usr" install --deps-mode=none "$srcdir/bcrypt-${pkgver/_/-}.src.rock"
  rm -Rf "$pkgdir/usr/lib/luarocks"
}

sha256sums=('444f08a2566f6354247df20c76a7af38fae184c517841fbeeff23fc55364b757')
