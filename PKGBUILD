# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
pkgname=diffh
pkgver=0.3.2
pkgrel=2
pkgdesc="Makes browsing diff output easy, converting it to highly-readable highlighted Wikipedia-style HTML"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/$pkgname/"
license=('GPL2')
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('f6a15436b0b367312cbc29091ce1a145')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

