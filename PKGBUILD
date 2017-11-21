# Maintainer: James Hendrie <hendrie.james@gmail.com>
pkgname=bin2dec
pkgver=1.5
pkgrel=1
epoch=
pkgdesc="Converts binary numbers to decimal integers or ASCII text"
arch=('i686' 'x86_64')
url="https://github.com/jahendrie/bin2dec"
license=('custom:FreeBSD')
groups=()
depends_x86_64=('glibc')
depends_i686=('lib32-glibc')
makedepends=('gcc' 'make')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.someplacedumb.net/content/progs/$pkgname/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('557ea228f812755145c79a817633585b')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	#./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
    echo "$pkgdir"
    make PREFIX="$pkgdir/usr" install
	#make DESTDIR="$pkgdir/" install
}
