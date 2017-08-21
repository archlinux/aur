# Maintainer: inori <github.com/inoriy>
pkgname=astra
pkgver=2.9.3
pkgrel=1
pkgdesc="VC/PM identifiers for bash"

url="https://github.com/inoriy/astra"
license=("GPL-3.0")

source=("https://github.com/inoriy/astra/archive/v$pkgver-$pkgrel.tar.gz")
md5sums=('0c622f2a5dd14862d9766685a7eded65')

arch=("any")
depends=("glibc" "perl")

package(){
	cd "$pkgname-$pkgver-$pkgrel"
	make ROOT="$pkgdir" VERSION="$pkgver-$pkgrel"
}
