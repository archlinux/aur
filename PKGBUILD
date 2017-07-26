# Maintainer: inori <github.com/inoriy>
pkgname=astra
pkgver=2.5.2
pkgrel=1
pkgdesc="VC/PM identifiers for bash"

url="https://github.com/inoriy/astra"
license=("MIT")

source=("https://github.com/inoriy/astra/archive/v$pkgver-$pkgrel.tar.gz")
md5sums=('6cf38fc876ca5513d6517ba2abc523cc')

arch=("any")
depends=("ncurses" "perl")

package(){
	cd "$pkgname-$pkgver-$pkgrel"
	sudo make ROOT="$pkgdir" VERSION="$pkgver-$pkgrel"
}
