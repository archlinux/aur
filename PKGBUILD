# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-mediator
pkgver=1.1.2
_rockname=mediator_lua
_rockrel=0
pkgrel=1
pkgdesc="Event handling through channels"
arch=('i686' 'x86_64')
url="http://olivinelabs.com/mediator_lua/"
license=('MIT')
depends=('lua')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.rockspec")
sha256sums=('751debefe0aa00fa93c0ae6371922055289e9948b0231d1430c214118fdb3f3b')

package() {
  luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.rockspec"
  find "$pkgdir/usr" -name manifest -delete
}
