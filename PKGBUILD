
# Maintainer: Filippo Ranza <filipporanza@gmail.com>
pkgname=bfi
pkgver=0.1_2_g87c4e80
pkgrel=1
pkgdesc="Brainfuck interpreter with interactive shell"
arch=('i686' 'x86_64')
url="git@github.com:FilippoRanza/bfi.git"
makedepends=('git')
license=('GPL')
depends=('readline')
source=('git+https://github.com/FilippoRanza/bfi.git')
md5sums=('SKIP')


build() {
	cd "$pkgname"
	./configure --prefix=/usr
	make
}


package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
