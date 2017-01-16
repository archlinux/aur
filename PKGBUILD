# Maintainer: Nathan Jones <nathanj439@gmail.com>
pkgname=wbox
pkgver=5
pkgrel=1
pkgdesc="HTTP testing tool"
arch=('i686' 'x86_64')
url="http://www.hping.org/wbox/"
license=('BSD')
source=("http://www.hping.org/wbox/$pkgname-$pkgver.tar.gz")
md5sums=('a95ca2c69982db10704b5ed482c9c722')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 wbox $pkgdir/usr/bin/wbox
}
