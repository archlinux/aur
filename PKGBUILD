# Maintainer: Eugenio M. Vigo <emvigo@gmail.com>

pkgname=minitimer
pkgver=2.0.3
pkgrel=1
pkgdesc='Mini Timer - A timer in your terminal'
arch=('x86_64')
url='https://github.com/emvigo/minitimer'
license=('APACHE')
depends=('glibc')
source=("https://github.com/emvigo/minitimer/archive/$pkgver.tar.gz")
sha256sums=('79a33626979d54c23981b6963db71df29399c47261cecd651b97126984227a99')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	make PREFIX="$pkgdir/usr" install
}
