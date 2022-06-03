# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='luastatic'
pkgver=0.0.12 
pkgrel=2
pkgdesc='Build a standalone executable from a Lua program.'
arch=('any')
url='https://github.com/ers35/luastatic'
license=('custom:CC0')
depends=('lua')
source=("$pkgname-$pkgver::https://github.com/ers35/luastatic/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('83bdf50536eb9f817c394d309a56a1476b3d40262ab9e1a81b185f2d599ebfe523ebbf8559837a710b679941908aea1dc5bfd6e9aba6420b8cc41273d8a1b731')

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 luastatic.lua "$pkgdir"/usr/bin/$pkgname
}
