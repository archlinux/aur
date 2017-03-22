# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>
pkgname=wiking
pkgver=1.0.0
pkgrel=1
pkgdesc="Next generating wiki software that doesn't suck."
arch=(any)
url="https://github.com/XenGi/WikiNG"
license=('MIT')
depends=('python>=3.4'
         'python-django>=1.10')
#checkdepends=()
#optdepends=()
#backup=()
install=wiking.install
source=("wiking::git+https://github.com/XenGi/WikiNG/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

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
	#make DESTDIR="$pkgdir/" install
}
