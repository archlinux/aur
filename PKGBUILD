# Maintainer: Priyank Chaudhary <priyank21 AT outlook DOT com>
pkgname=fortune-mod-asoiaf
pkgver=20150916
pkgrel=1
pkgdesc="Fortune cookies from A Song of Ice and Fire series"
arch=(any)
url="https://github.com/pronoid/fortune-mod-asoiaf"
license=('MIT')
depends=(fortune-mod)
makedepends=(git)

build () {
	git clone https://github.com/pronoid/fortune-mod-asoiaf.git
}

package() {
	cd "${srcdir}/fortune-mod-asoiaf"
	install -D -m644 asoiaf "${pkgdir}/usr/share/fortune/asoiaf"
	install -D -m644 asoiaf.dat "${pkgdir}/usr/share/fortune/asoiaf.dat"
}