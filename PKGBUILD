pkgname=tickr
pkgver=0.6.4
pkgrel=1
pkgdesc="GTK-based highly graphically-customizable Feed Ticker"
arch=('x86_64' 'i686')
url="http://open-tickr.net"
license=('GPL')
source=("http://open-tickr.net/src/tickr-0.6.4.tar.gz")
md5sums=('SKIP')

build() {
	cd $pkgname-$pkgver
	./configure
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
}
