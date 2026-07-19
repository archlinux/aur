pkgname=dice_roller
pkgver=0.0.3
pkgrel=1
pkgdesc='Dice roller for the terminal. If you want one.'
arch=('any')
license=('MIT')
depends=('make' 'gcc')
source=('https://github.com/Krak9n/dice_roller/archive/refs/tags/0.0.3.tar.gz')
sha256sums=('SKIP')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	sudo make PREFIX=/usr install
}
