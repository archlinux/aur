# Xabre <Xabre@archlinux.info>

pkgname=lua51-lcf
pkgver=5.1
_rockname=lcf
_rockrel=2
pkgrel=3
pkgdesc="Lua code formatter (for Lua 5.1)"
arch=('i686' 'x86_64')
url="https://github.com/martin-eden/lua_code_formatter"
license=('GPL')
depends=('lua51')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/${_rockname}-${pkgver}-${_rockrel}.src.rock")
sha256sums=('318af3a5783c696e91ee2e7377b54e16651965ac93b0b71435a9fc7957428cd3')

package() {
  luarocks --lua-version=5.1 --tree="$pkgdir/usr" install --deps-mode=none "${_rockname}-${pkgver}-${_rockrel}.src.rock"
  find "$pkgdir/usr" -name manifest -delete
}
