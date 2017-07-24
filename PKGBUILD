# Maintainer: inori <github.com/inoriy>
pkgname=astra
pkgver=1.8.2
pkgrel=2
pkgdesc="VC/PM identifiers for bash"

url="https://github.com/inoriy/astra"
license=("MIT")

source=("https://github.com/inoriy/astra/archive/v$pkgver-$pkgrel.tar.gz")
md5sums=('ae2bab9ddef11907b6a3c76d483def3f')

arch=("any")
depends=("ncurses" "perl")

package(){
	cd "$pkgname-$pkgver-$pkgrel"
	make ROOT="$pkgdir"
}
