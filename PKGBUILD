# Maintainer: inori <github.com/inoriy>
pkgname=astra
pkgver=2.7.0
pkgrel=1
pkgdesc="VC/PM identifiers for bash"

url="https://github.com/inoriy/astra"
license=("MIT")

source=("https://github.com/inoriy/astra/archive/v$pkgver-$pkgrel.tar.gz")
md5sums=('e967969e9d0ec439936c3e24c832413c')

arch=("any")
depends=("ncurses" "perl")

package(){
	cd "$pkgname-$pkgver-$pkgrel"
	sudo make ROOT="$pkgdir" VERSION="$pkgver-$pkgrel"
}
