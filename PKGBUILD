# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-luassert
pkgver=1.8.0
_rockname=luassert
_rockrel=0
pkgrel=1
pkgdesc="Lua Assertions Extension"
arch=('i686' 'x86_64')
url="http://olivinelabs.com/busted/"
license=('MIT')
depends=('lua' 'lua-say')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.rockspec")
sha256sums=('e1fb3f76453dcaac009ee3981beec670bf6da240ffd09773c5044f6a03f22485')

package() {
  luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.rockspec"
  find "$pkgdir/usr" -name manifest -delete
}
