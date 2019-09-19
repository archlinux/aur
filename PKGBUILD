# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-pegdebug
pkgver=0.40
_rockname=pegdebug
_rockrel=2
pkgrel=1
pkgdesc="PegDebug is a trace debugger for LPeg rules and captures"
arch=('i686' 'x86_64')
url="http://github.com/pkulchenko/PegDebug"
license=('MIT')
depends=('lua' 'lua-lpeg')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.rockspec")
sha256sums=('4ae6b445973ad72354d137ba8d0ab0655d2d83cf71fe83d67ce27d0f38e0c646')

package() {
  luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.rockspec"
  find "$pkgdir/usr" -name manifest -delete
}
