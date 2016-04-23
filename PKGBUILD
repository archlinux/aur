# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-utf8
pkgver=0.1.1
_rockname=luautf8
_rockrel=1
pkgrel=1
pkgdesc="Add UTF-8 support to Lua, compatible with Lua string module."
arch=('i686' 'x86_64')
url="http://github.com/starwing/luautf8"
license=('MIT')
depends=('lua')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/${_rockname}-${pkgver}-${_rockrel}.src.rock")
sha256sums=('51aa211a9d39d62c65bfcca4eccb8482a11bfe918992eed58104b646338d62a0')

package() {
  luarocks --tree="$pkgdir/usr" install "${_rockname}-${pkgver}-${_rockrel}.src.rock"
}

