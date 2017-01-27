#Maintainer: leo <leotemplin@yahoo.de>
pkgname=hello
pkgver=2.10
pkgrel=1
pkgdesc="Prints Hello World and more"
arch=(i686 x86_64)
url='https://gnu.org'
license=('GPL')

source=(https://ftp.gnu.org/gnu/hello/$pkgname-$pkgver.tar.gz)
md5sums=('6cd0ffea3884a4e79330338dcc2987d6')

build(){
cd "$pkgname-$pkgver"
./configure --prefix=/usr
make
}
package(){
cd "$pkgname-$pkgver"
make DESTDIR="$pkgdir/" install
}
