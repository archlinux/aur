# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>
pkgname=wiking
pkgver=1.0.0
pkgrel=2
pkgdesc="Next generating wiki software that doesn't suck."
arch=(any)
url="https://github.com/XenGi/WikiNG"
license=('MIT')
makedepends=('go')
#backup=()
source=("wiking::git+https://github.com/XenGi/WikiNG.git#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"
    #patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$srcdir/$pkgname"
	#./configure --prefix=/usr
	#make
}

check() {
	cd "$srcdir/$pkgname"
	go test
}

package() {
	cd "$srcdir/$pkgname"
	#make DESTDIR="$pkgdir/" install
}
