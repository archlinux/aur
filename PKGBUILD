# Maintainer: Dmitrij D. Czarkoff <czarkoff@gmail.com>
pkgname=rem
pkgver=0.5.0
pkgrel=1
pkgdesc="portable library for real-time audio and video processing"
arch=('i686' 'x86_64')
url="http://creytiv.com/rem.html"
license=('BSD')
depends=('re')
source=("http://creytiv.com/pub/$pkgname-$pkgver.tar.gz")
md5sums=('042b8951fd5da7b25eb3f9aa942cae74')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
