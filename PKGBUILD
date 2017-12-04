# Xabre <Xabre@archlinux.info>

pkgname=lua51-lcf
pkgver=5.1
_rockname=lcf
_rockrel=1
pkgrel=1
pkgdesc="Lua code formatter (for Lua 5.1)"
arch=('i686' 'x86_64')
url="https://github.com/martin-eden/lua_code_formatter"
license=('GPL')
depends=('lua51')
makedepends=('luarocks5.1')
conflicts=()
source=("https://luarocks.org/${_rockname}-${pkgver}-${_rockrel}.src.rock")
sha256sums=('45c23113d84f2e76a0b04f000d708dd91da0d0b7de55066bfa77183a4d1baab9')

package() {
  luarocks-5.1 --tree="$pkgdir/usr" install --deps-mode=none "${_rockname}-${pkgver}-${_rockrel}.src.rock"
  find "$pkgdir/usr" -name manifest -delete
}
