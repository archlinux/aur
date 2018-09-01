# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-yaml
pkgver=1.1.2
_rockname=yaml
_rockrel=1
pkgrel=1
pkgdesc="LibYAML binding for Lua"
arch=('i686' 'x86_64')
url="http://luaforge.net/projects/yaml/"
license=('MIT')
depends=('lua' 'lua-lub')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.src.rock")
sha256sums=('0f63e9b49f8879944372552bc197e567bd70eee6da2f2d5219b3b16a2331837e')

package() {
  luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.src.rock"
  find "$pkgdir/usr" -name manifest -delete
}
