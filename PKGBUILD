# Maintainer: Petar Benke <makepkg@benke.co.uk>
pkgname=cutmp3
pkgver=3.0.1
pkgrel=1
pkgdesc="Edit mp3 (and mp2) files without quality loss"
arch=('i686' 'x86_64')
url="http://www.puchalla-online.de/cutmp3.html"
license=('GPL')
depends=('readline')
source=("http://www.puchalla-online.de/$pkgname-$pkgver.tar.bz2")
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr" install
}
