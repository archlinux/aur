# Maintainer: inori <github.com/inoriy>
pkgname=astra
pkgver=1.9.4
pkgrel=2
pkgdesc="VC/PM identifiers for bash"

url="https://github.com/inoriy/astra"
license=("MIT")

source=("https://github.com/inoriy/astra/archive/v$pkgver-$pkgrel.tar.gz")
md5sums=('c4dfd7e9b6f1660d136220a6aa842abb')

arch=("any")
depends=("ncurses" "perl")

package(){
	cd "$pkgname-$pkgver-$pkgrel"
	make ROOT="$pkgdir"
}
