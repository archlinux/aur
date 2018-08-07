# Maintainer : E5ten <e5ten.arch@gmail.com>

pkgname=scrap
pkgver=1.1
pkgrel=5
url="https://web.archive.org/web/20130524032130/http://www.math.leidenuniv.nl/~mommen/scrap/"
arch=('x86_64')
pkgdesc="A roguelike game that was written during a period of ten days."
provides=('scrap')
source=("scrap.tar.xz")
md5sums=('0e0e2096988b092541c9c70e9b151482')
build() {
	make
}
package() {
	install -Dm755 $srcdir/scrap $pkgdir/usr/bin/scrap
}

