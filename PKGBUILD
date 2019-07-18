# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=nicotest
pkgver=2.5
pkgrel=1
epoch=
pkgdesc="calculator bash nico"
arch=('x86_64')
url="http://w-calc.sourceforge.net/"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://downloads.sourceforge.net/nicotest/$pkgname-$pkgver.tar.bz2") 
md5sums=('45b02ba339a813ffc65f154d1e54a04b')

prepare() {
	cd "$pkgname-$pkgver"
	
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
