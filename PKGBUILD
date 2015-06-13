# Maintainer: Mitch Bigelow <ipha00@gmail.com>
pkgname=pixiewps
pkgver=1.1
pkgrel=1
pkgdesc="Offline bruteforce of the WPS pin exploiting the low or non-existing entropy of some APs"
arch=('i686' 'x86_64')
url="https://github.com/wiire/pixiewps"
license=('GPL')
depends=('openssl')
source=(https://github.com/wiire/pixiewps/archive/v$pkgver.tar.gz)
md5sums=('4f0830376ba45831556772dde624c79e')

build() {
	cd "$pkgname-$pkgver"/src
	make
}

package() {
	cd "$pkgname-$pkgver"/src
	make PREFIX="$pkgdir/usr" install
}
