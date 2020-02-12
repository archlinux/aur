# Manitainer:
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=lua51-checks
pkgver=1.0
_rockname=checks
_rockrel=1
pkgrel=1
pkgdesc="Easy, terse, readable and fast function arguments type checking"
arch=('i686' 'x86_64')
url='https://github.com/SierraWireless/luasched'
license=('GPL')
depends=('lua51')
makedepends=('luarocks')
# TODO: fix to use some actual source instead of src.rock
# source=("https://github.com/fab13n/$_rockname/raw/master/$_rockname-$pkgver-$_rockrel.tar.gz")
# sha256sums=('df27e8b3d176fba80dd12d624795397ba7919ddb112cb53f108d36b6acccaa92')
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.src.rock")
sha256sums=('3f56ab82bd1e6e58304f833fd142d77964dcf9392ef0d6df11bb19612e37fb33')

package() {
  luarocks --lua-version=5.1 --tree="$pkgdir/usr/" install --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.src.rock"
}
