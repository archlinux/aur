# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-lub
pkgver=1.1.0
_rockname=lub
_rockrel=1
pkgrel=1
pkgdesc='Lubyk base module'
arch=('i686' 'x86_64')
url='https://luarocks.org/modules/gaspard/lub'
license=('MIT')
depends=('lua' 'lua-filesystem')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.src.rock")
sha256sums=('ff420e115839aa4d8b8b5aa5d4b1c5f5cc267928e6f21b8265e7ee359969cf06')

package() {
    luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.src.rock"
    find "$pkgdir/usr" -name manifest -delete
}
