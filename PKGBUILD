# Maintainer: inori <github.com/inoriy>
pkgname=astra
pkgver=2.7.1
pkgrel=1
pkgdesc="VC/PM identifiers for bash"

url="https://github.com/inoriy/astra"
license=("MIT")

source=("https://github.com/inoriy/astra/archive/v$pkgver-$pkgrel.tar.gz")
md5sums=('e02652e73cf96782a99ee94e14a8a8ae')

arch=("any")
depends=("ncurses" "perl")

package(){
	cd "$pkgname-$pkgver-$pkgrel"
	sudo make ROOT="$pkgdir" VERSION="$pkgver-$pkgrel"
}
