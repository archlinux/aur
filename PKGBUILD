# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-term
pkgver=0.7
_rockname=lua-term
_rockrel=1
pkgrel=1
pkgdesc="Terminal functions for Lua"
arch=('i686' 'x86_64')
url="https://github.com/hoelzro/lua-term"
license=('MIT')
depends=('lua')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.rockspec")
sha256sums=('e2edece302c1c14ba2b416d973c095801e7f32c50d156ea46f21e37bb82c2f65')

package() {
  luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.rockspec"
  find "$pkgdir/usr" -name manifest -delete
}
