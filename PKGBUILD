# Maintainer: James Hendrie <hendrie.james@gmail.com>
pkgname=dec2bin
pkgver=1.5
pkgrel=2
epoch=
pkgdesc="Converts binary numbers to decimal integers or ASCII text"
arch=('i686' 'x86_64')
url="https://github.com/jahendrie/dec2bin"
license=('FreeBSD')
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
source=("https://github.com/jahendrie/dec2bin/releases/download/v1.5/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('962d93b30956edf56dd8ad3411228b9f')
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
