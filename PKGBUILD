# Maintainer: inori <github.com/inoriy>
pkgname=astra
pkgver=1.9.4
pkgrel=1
pkgdesc="VC/PM identifiers for bash"

url="https://github.com/inoriy/astra"
license=("MIT")

source=("https://github.com/inoriy/astra/archive/v$pkgver-$pkgrel.tar.gz")
md5sums=('b5e2909060eee86c41a1d9f5d254c361')

arch=("any")
depends=("ncurses" "perl")

package(){
	cd "$pkgname-$pkgver-$pkgrel"
	make ROOT="$pkgdir"
}
