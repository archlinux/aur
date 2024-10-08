# Mantainer: fossdd <fossdd@pwned.life>

pkgname=t14s-g4-impulses
pkgver=1
pkgrel=1
pkgdesc='Dolby Atmos Convolver impulses for Thinkpad T14s Gen 4'
url='https://codeberg.org/fossdd/t14s-g4-impulses'
arch=('any')
license=('unknown')
depends=()
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('4a0128f53a03886cd764b2481f48b8c0cb5412552f46223d04bd558a4480d3b3')

package() {
	cd "$pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
