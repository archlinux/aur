# Maintainer: Priyank Chaudhary <priyank21 AT outlook DOT com>
pkgname=fortune-mod-dhammapada
pkgver=1
pkgrel=1
pkgdesc="A collection of Fortune cookies from the Buddha's Dhammapada"
arch=(any)
url="https://github.com/pronoid/fortune-mod-dhammapada"
license=('MIT')
depends=(fortune-mod)
makedepends=(git)

build () {
	git clone https://github.com/pronoid/fortune-mod-dhammapada.git
}

package() {
	cd "${srcdir}/fortune-mod-dhammapada"
	install -D -m644 dhammapada "${pkgdir}/usr/share/fortune/dhammapada"
	install -D -m644 dhammapada.dat "${pkgdir}/usr/share/fortune/dhammapada.dat"
}