# Maintainer: Md. Jahidul Hamid <jahidulhamid@yahoo.com>
pkgname=pacget
pkgver=1.0.4
pkgrel=1
epoch=
pkgdesc="A wrapper around pacaur to mimic yaourt's search feature"
arch=('any')
url="https://github.com/neurobin/pacget"
license=('GPL')
groups=()
depends=('pacaur')
makedepends=()
checkdepends=()
optdepends=('pkgfile: support for package search by file name')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/neurobin/$pkgname/archive/$pkgver.tar.gz")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	#patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$pkgname-$pkgver"
	#./configure --prefix=/usr
	#make
}

check() {
	cd "$pkgname-$pkgver"
	#make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
