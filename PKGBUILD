# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-say
pkgver=1.3
_rockname=say
_rockrel=1
pkgrel=1
pkgdesc="Lua String Hashing/Indexing Library"
arch=('i686' 'x86_64')
url="http://olivinelabs.com/busted/"
license=('MIT')
depends=('lua')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.rockspec")
sha256sums=('bbc1d5bf43620daad2d3a355822709ad77f1cd62705c3ec0c9a6710c167d762e')

package() {
  luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.rockspec"
  find "$pkgdir/usr" -name manifest -delete
}
