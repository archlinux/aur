# Maintainer: Eugenio M. Vigo <emvigo@gmail.com>

pkgname=minitimer
pkgver=2.5.0
pkgrel=1
pkgdesc='Mini Timer - A timer in your terminal'
arch=('x86_64')
url='https://git.sr.ht/~emvigo/minitimer'
license=('APACHE')
depends=('glibc')
source=("https://git.sr.ht/~emvigo/minitimer/archive/$pkgver.tar.gz")
sha256sums=('f2ce173a305b12992581d92667f4ff84521b9bdc0c7f525c99c1a1f440f34c3f')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX='/usr' install
}
