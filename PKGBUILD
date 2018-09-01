# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-cosmo
pkgver=16.06.04
_rockname=cosmo
_rockrel=1
pkgrel=1
pkgdesc="Safe templates for Lua"
arch=('i686' 'x86_64')
url="http://cosmo.luaforge.net/"
license=('MIT')
depends=('lua' 'lua-lpeg')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.src.rock")
sha256sums=('9c83d50c8b734c0d405f97df9940ddb27578214033fd0e3cfc3e7420c999b9a9')

package() {
  luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.src.rock"
  find "$pkgdir/usr" -name manifest -delete
}
