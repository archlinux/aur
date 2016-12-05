# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-luassert
pkgver=1.7.11
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
sha256sums=('1ab435fbbdb56956bdded3a5ddba9eabefa08939a1f5d5e4fe9229b4d9f2ef8b')

package() {
  luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.rockspec"
  find "$pkgdir/usr" -name manifest -delete
}
