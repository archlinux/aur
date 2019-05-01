# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua51-formatter
pkgver=0.1.1
_rockname=formatter
_rockrel=1
pkgrel=1
pkgdesc="Beautifies Lua code"
arch=('i686' 'x86_64')
url="https://luarocks.org/modules/luarocks/formatter"
license=('GPL')
depends=('lua51' 'lua15-checks' 'lua51-metalua-compiler' 'lua51-penlight')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/${_rockname}-${pkgver}-${_rockrel}.src.rock")
sha256sums=('1db31a2d840cc75e3ecbb6ba21d76085c2efaa639b98667c717da2e2d9317a5f')

package() {
  luarocks --lua-version=5.1 --tree="$pkgdir/usr" install --deps-mode=none "${_rockname}-${pkgver}-${_rockrel}.src.rock"
  find "$pkgdir/usr" -name manifest -delete
}
