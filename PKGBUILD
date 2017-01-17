# Maintainer: tequa 
pkgname=eltclsh
pkgver=1.16
pkgrel=1
epoch=
pkgdesc="eltclsh (editline tcl shell) is an interactive shell for the TCL programming language"
arch=('i686' 'x86_64' 'armv7h')
url="http://homepages.laas.fr/mallet/soft/shell/eltclsh"
license=('BSD')
groups=()
depends=('tcl' 'tk' 'libedit')
makedepends=('make' 'gcc')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://distfiles.openrobots.org/eltclsh/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('a13130374265b871ff17fdec357aee60')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
