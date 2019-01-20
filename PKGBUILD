# Maintainer: Enzo Barrett <enzobarrett@gmail.com>
pkgname=npiano
pkgver=0.9
pkgrel=1
pkgdesc="A piano in ncurses"
arch=('any')
url="https://github.com/enzobarrett/npiano"
license=('GPL')
depends=('ncurses' 'beep')
source=("${url}/archive/V${pkgver}.tar.gz")
sha256sums=('3154af8f47b38be55fef6efa4ee1683c9ab42faa0ec00d3c8803be80c586448f')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -m755 -D npiano $pkgdir/usr/bin/$pkgname
}
