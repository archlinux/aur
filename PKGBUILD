# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-cliargs
pkgver=3.0
_rockname=lua_cliargs
_rockrel=2
pkgrel=1
pkgdesc="A command-line argument parser."
arch=('i686' 'x86_64')
url="https://github.com/amireh/lua_cliargs"
license=('MIT')
depends=('lua')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.src.rock")
sha256sums=('3c79981292aab72dbfba9eb5c006bb37c5f42ee73d7062b15fdd840c00b70d63')

package() {
  luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.src.rock"
  find "$pkgdir/usr" -name manifest -delete
}
