# Maintainer: lesto <lestofante88@gmail.com>
pkgname=pacman-parallelizer
pkgver=5
pkgrel=2
pkgdesc="A minimal package downloader for pacman, using aria2"
arch=(any)
url="https://github.com/lestofante/PacmanParallelizer"
license=('GPL3')
depends=('aria2' 'pacman-contrib')
source=("pp.sh")
md5sums=('b7303091ecd5cdce68f91c95625253eb')

build() {
	cd "$srcdir"
	chmod +x ./pp.sh
}

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/bin"
	cp pp.sh "$pkgdir/usr/bin"
}
