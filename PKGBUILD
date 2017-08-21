# Maintainer: inori <github.com/inoriy>
pkgname=astra
pkgver=2.9.2
pkgrel=1
pkgdesc="VC/PM identifiers for bash"

url="https://github.com/inoriy/astra"
license=("GPL-3.0")

source=("https://github.com/inoriy/astra/archive/v$pkgver-$pkgrel.tar.gz")
md5sums=('050a3fd026b28104778bfdc9ecbc77d9')

arch=("any")
depends=("glibc" "perl")

package(){
	cd "$pkgname-$pkgver-$pkgrel"
	make ROOT="$pkgdir" VERSION="$pkgver-$pkgrel"
}
