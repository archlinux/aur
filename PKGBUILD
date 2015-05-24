# Maintainer: Brent Saner <brent (dot) saner (at) gmail (dot) com>
pkgname=dumpet
pkgver=2.1
pkgrel=2
pkgdesc="A tool for debugging El Torito boot images."
arch=('i686' 'x86_64')
url="https://fedorahosted.org/dumpet/"
license=('GPL2')
install=
changelog=
source=("https://fedorahosted.org/releases/d/u/dumpet/$pkgname-$pkgver.tar.bz2")
noextract=()
md5sums=('e55338e7e7163aa4a592a8f1a565f14a')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
