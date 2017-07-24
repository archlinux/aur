# Maintainer: inori <github.com/inoriy>
pkgname=astra
pkgver=1.4.15
pkgrel=1
pkgdesc="VC/PM identifiers for bash"

url="https://github.com/inoriy/astra"
license=("MIT")

source=("$pkgver-$pkgrel.tar.gz")
md5sums=("00c148c1464373e3414e981b3a297329")

arch=("any")
depends=("ncurses" "perl")

package(){
	cd "$pkgname-$pkgver-$pkgrel"
	make ROOT="$pkgdir"
}
