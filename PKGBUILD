# Maintainer: inori <github.com/inoriy>
pkgname=astra
pkgver=2.8.0
pkgrel=1
pkgdesc="VC/PM identifiers for bash"

url="https://github.com/inoriy/astra"
license=("MIT")

source=("https://github.com/inoriy/astra/archive/v$pkgver-$pkgrel.tar.gz")
md5sums=('44108c66a240acf02db3250263850f6b')

arch=("any")
depends=("ncurses" "perl")

package(){
	cd "$pkgname-$pkgver-$pkgrel"
	make ROOT="$pkgdir" VERSION="$pkgver-$pkgrel"
}
