# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-serpent
pkgver=0.28
_rockname=serpent
_rockrel=1
pkgrel=1
pkgdesc="Lua serializer and pretty printer"
arch=('i686' 'x86_64')
url="https://github.com/pkulchenko/serpent"
license=('MIT')
depends=('lua')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.rockspec")
sha256sums=('fdfbb5896aef1fd498f6ee6455e64fd7490f70c679d8bc14f7b4c06c4446915d')

package() {
  luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.rockspec"
  find "$pkgdir/usr" -name manifest -delete
}
