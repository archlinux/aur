# Maintainer: inori <github.com/inoriy>
pkgname=astra
pkgver=2.8.1
pkgrel=2
pkgdesc="VC/PM identifiers for bash"

url="https://github.com/inoriy/astra"
license=("GPL-3.0")

source=("https://github.com/inoriy/astra/archive/v$pkgver-$pkgrel.tar.gz")
md5sums=('3dd7616759111381c11ed3c761bbb1df')

arch=("any")
depends=("glibc" "perl")

package(){
	cd "$pkgname-$pkgver-$pkgrel"
	make ROOT="$pkgdir" VERSION="$pkgver-$pkgrel"
}
