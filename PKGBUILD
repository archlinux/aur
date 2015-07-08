pkgname=cronutils
pkgver=1.8
pkgrel=1
pkgdesc=""
arch=(i686 x86_64)
license=('Apache')
source=("https://github.com/google/$pkgname/archive/version/$pkgver.tar.gz")
md5sums=()

build() {
	cd "$pkgname-version-$pkgver"
	make
}

check() {
	cd "$pkgname-version-$pkgver"
	make test
}

package() {
	cd "$pkgname-version-$pkgver"
	make prefix=/usr DESTDIR="$pkgdir/" install
}
md5sums=('827fdf82ed8ee3a8cb41575ef0ada361')
