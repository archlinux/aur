# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-pegdebug
pkgver=0.41
_rockname=pegdebug
_rockrel=1
pkgrel=1
pkgdesc="PegDebug is a trace debugger for LPeg rules and captures"
arch=('i686' 'x86_64')
url="http://github.com/pkulchenko/PegDebug"
license=('MIT')
depends=('lua' 'lua-lpeg')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.rockspec")
sha256sums=('42576660d3089a5089405139dbcac670a1c5aaeb7fadefea177ab505a892444a')

package() {
  luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.rockspec"
  find "$pkgdir/usr" -name manifest -delete
}
