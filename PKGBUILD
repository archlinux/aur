#Package from: Keidan <https://github.com/Keidan>
#Maintainer : Sasasu <lizhaolong0123@gmail.com>
pkgname=hex2bin
pkgver=20161016
pkgrel=1
pkgdesc="Hex to binary converter."
arch=('any')
url="https://github.com/mike2718/moefmcmd.git"
license=('GPL3')
depends=('gcc')
makedepends=('git' 'make')
source=("$pkgname::git+https://github.com/Keidan/hex2bin")
md5sums=('SKIP')

build() {
	cd "$srcdir"/"$_pkgname/$pkgname"
	make
}
package() {
	cd "$srcdir"/"$_pkgname/$pkgname"
	mkdir -p "$pkgdir"/usr/bin
	install -Dm755 "hex2bin" "$pkgdir"/usr/bin
}
