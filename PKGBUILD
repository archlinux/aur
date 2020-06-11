# Maintainer: Eugenio M. Vigo <emvigo@gmail.com>

pkgname=minitimer
pkgver=2.3.0
pkgrel=1
pkgdesc='Mini Timer - A timer in your terminal'
arch=('x86_64')
url='https://git.sr.ht/~emvigo/minitimer'
license=('APACHE')
depends=('glibc')
source=("https://git.sr.ht/~emvigo/minitimer/archive/$pkgver.tar.gz")
sha256sums=('f4ff78950b74700a43967e2a9cb7e56f820c7d31d44d1ee1221648435c05f263')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX='/usr' install
}
