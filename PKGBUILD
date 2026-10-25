# Maintainer: Matthew Sexton <Matthew@Asylumtech.com>
#contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
#Contributor: leo <leotemplin@yahoo.de>
pkgname=hello
pkgver=2.12.3
pkgrel=1
pkgdesc="Prints Hello World and more"
arch=(i686 x86_64)
url='https://www.gnu.org/software/hello/'
license=('GPL')

source=(https://ftp.gnu.org/gnu/hello/$pkgname-$pkgver.tar.gz)
md5sums=('abf08b16a616ed2902df4ab4846884be')

build(){
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package(){
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
