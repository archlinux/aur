# Maintainer: Charles L <charliehogger31@gmail.com>

pkgname=minitimer
pkgver=2.5.2
pkgrel=1
pkgdesc='Mini Timer - A timer in your terminal'
arch=('x86_64')
url='https://git.sr.ht/~emvigo/minitimer'
license=('APACHE')
depends=('glibc')
source=("https://git.sr.ht/~emvigo/minitimer/archive/$pkgver.tar.gz")
sha256sums=('5cf5694863a649f73ab4c2ebc5d2efc03a455b94bf325fc698316c1a13bde314')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX='/usr' install
}
