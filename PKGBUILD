# Maintainer: inori <github.com/inoriy>
pkgname=astra
pkgver=2.2.3
pkgrel=1
pkgdesc="VC/PM identifiers for bash"

url="https://github.com/inoriy/astra"
license=("MIT")

source=("https://github.com/inoriy/astra/archive/v$pkgver-$pkgrel.tar.gz")
md5sums=('c13f6fa910ea74f1acdea0383f153701')

arch=("any")
depends=("ncurses" "perl")

package(){
	cd "$pkgname-$pkgver-$pkgrel"
	make ROOT="$pkgdir"
}
