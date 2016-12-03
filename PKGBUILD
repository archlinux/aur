# Maintainer: Dmitrij D. Czarkoff <czarkoff@gmail.com>
pkgname=re
pkgver=0.5.0
pkgrel=1
pkgdesc="portable library for real-time communications"
arch=('i686' 'x86_64')
url="http://creytiv.com/re.html"
license=('BSD')
depends=('openssl' 'zlib')
source=("http://creytiv.com/pub/$pkgname-$pkgver.tar.gz")
md5sums=('40823ef4391886fbe3ecad665180e98b')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
