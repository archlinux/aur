# Maintainer: lesto <lestofante88@gmail.com>
pkgname=pacman-parallelizer
pkgver=8
pkgrel=1
pkgdesc="A minimal package downloader for pacman, using aria2"
arch=(any)
url="https://github.com/lestofante/PacmanParallelizer"
license=('GPL3')
depends=('aria2' 'pacman-contrib')
source=("pp.sh")
md5sums=('626c0d5518131fcb5e9b151db1e1d93e')

build() {
	cd "$srcdir"
	chmod +x ./pp.sh
}

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/bin"
	cp pp.sh "$pkgdir/usr/bin"
}
