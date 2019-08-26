# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=luaepnf
pkgname=lua-$_rockname
pkgver=0.3
_rockrel=1
pkgrel=1
pkgdesc="Extended PEG Notation Format (easy grammars for LPeg)"
arch=('i686' 'x86_64')
url="http://siffiejoe.github.com/lua-luaepnf/"
license=('MIT')
depends=('lua' 'lua-lpeg')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.rockspec")
sha256sums=('95455d167555e9716bf91300a987281eeed761330570f8b1e59fb84813480d55')

package() {
  luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.rockspec"
  find "$pkgdir/usr" -name manifest -delete
}
