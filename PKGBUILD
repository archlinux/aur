# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-path
pkgver=0.3.1
_rockname=lua-path
_rockrel=1
pkgrel=1
pkgdesc="File system path manipulation library"
arch=('i686' 'x86_64')
url="https://github.com/moteus/lua-path"
license=('MIT')
depends=('lua')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.rockspec")
sha256sums=('bde578f79d032ccda47da4d73e0633281b3e0497c54b87a8667acfc477491e50')

package() {
  luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.rockspec"
  find "$pkgdir/usr" -name manifest -delete
}
