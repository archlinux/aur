# Contributor: Mattias Hermansson <hexagenic [at] gmail [dot] com>

pkgname=z80asm
pkgver=1.8
pkgrel=2
pkgdesc="A Z80 assembler written in c"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/z80asm/"
license=('GPL3')
depends=()
source=(http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('4beb798d6fe2f89e62de36b4b4f87fad')

build() {
 	cd $pkgname-$pkgver
 	make
}

package() {
 	cd $pkgname-$pkgver
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

