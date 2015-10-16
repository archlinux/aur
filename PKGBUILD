# Maintainer: Dmitrij D. Czarkoff <czarkoff@gmail.com>
pkgname=rem
pkgver=0.4.6
pkgrel=1
pkgdesc="portable library for real-time audio and video processing"
arch=('i686' 'x86_64')
url="http://creytiv.com/rem.html"
license=('BSD')
depends=('re')
#changelog=ChangeLog
source=("http://creytiv.com/pub/$pkgname-$pkgver.tar.gz")
md5sums=('888c3000aa002790cc7129fa72d39a58')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
