# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-colors
pkgver=8.05.26
_rockname=colors
_rockrel=1
pkgrel=1
pkgdesc="library provides methods to do color computation in HSL color space and for finding harmonious color palettes"
arch=('i686' 'x86_64')
url="http://sputnik.freewisdom.org/lib/colors/"
license=('MIT')
depends=('lua')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.src.rock")
sha256sums=('6bffdd058af3f97c72a3e7fcfc7933a18c68661f4d559657a368e160ecc98071')

package() {
  luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.src.rock"
  find "$pkgdir/usr" -name manifest -delete
}
