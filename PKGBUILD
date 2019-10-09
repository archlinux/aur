# Maintainer: lesto <lestofante88@gmail.com>
pkgname=pacman-parallelizer
pkgver=7
pkgrel=1
pkgdesc="A minimal package downloader for pacman, using aria2"
arch=(any)
url="https://github.com/lestofante/PacmanParallelizer"
license=('GPL3')
depends=('aria2' 'pacman-contrib')
source=("pp.sh")
md5sums=('366163f7c8af9dd5b8e89e75e430810c')

build() {
	cd "$srcdir"
	chmod +x ./pp.sh
}

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/bin"
	cp pp.sh "$pkgdir/usr/bin"
}
