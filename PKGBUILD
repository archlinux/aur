# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua51-checks
pkgver=1.0
_rockname=checks
_rockrel=1
pkgrel=1
pkgdesc="Easy, terse, readable and fast function arguments type checking"
arch=('i686' 'x86_64')
url="https://github.com/SierraWireless/luasched"
license=('GPL')
depends=('lua51')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/${_rockname}-${pkgver}-${_rockrel}.src.rock")
sha256sums=('3f56ab82bd1e6e58304f833fd142d77964dcf9392ef0d6df11bb19612e37fb33')

package() {
  luarocks --lua-version=5.1 --tree="$pkgdir/usr" install --deps-mode=none "${_rockname}-${pkgver}-${_rockrel}.src.rock"
  find "$pkgdir/usr" -name manifest -delete
}
