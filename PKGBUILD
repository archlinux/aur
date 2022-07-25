# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
#Contributor: leo <leotemplin@yahoo.de>
pkgname=hello
pkgver=2.12.1
pkgrel=1
pkgdesc="Prints Hello World and more"
arch=(i686 x86_64)
url='https://gnu.org'
license=('GPL')

source=(https://ftp.gnu.org/gnu/hello/$pkgname-$pkgver.tar.gz)
md5sums=('5cf598783b9541527e17c9b5e525b7eb')

build(){
cd "$pkgname-$pkgver"
./configure --prefix=/usr
make
}
package(){
cd "$pkgname-$pkgver"
make DESTDIR="$pkgdir/" install
}
