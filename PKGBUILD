# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua51-metalua-parser
pkgver=0.7.3
_rockname=metalua-parser
_rockrel=2
pkgrel=1
pkgdesc="Metalua's parser: converting Lua source strings and files into AST"
arch=('i686' 'x86_64')
url="https://luarocks.org/modules/luarocks/metalua-parser"
license=('GPL')
depends=('lua51')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.src.rock")
sha256sums=('3a2556a999c215641bc6e443a6a3d3a61238ee67b5abd9f706737b125a3a2ef6')

package() {
  luarocks --lua-version=5.1 --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.src.rock"
  find "$pkgdir/usr" -name manifest -delete
}
