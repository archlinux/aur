# Maintainer: Julius Schumacher <juliusschumacher@gmail.com>
pkgname=tsim
pkgver=0.84
pkgrel=1
epoch=
pkgdesc="Simulation code for Principles of Concurrent Programming at CTH, courses TDA384/DIT391"
arch=(x86_64)
url="http://www.cse.chalmers.se/edu/course/TDA384_LP3/resources/"
license=('unknown')
groups=()
depends=(libxaw libxt libxmu libx11 libxext)
makedepends=()
checkdepends=()
optdepends=()
provides=(tsim)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.cse.chalmers.se/edu/course/TDA384_LP3/files/labs/$pkgname-$pkgver.tgz")
noextract=()
md5sums=(bb867e53ad884a1c6f7f67999ce1b0bc)
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
