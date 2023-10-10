# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Petar Benke <makepkg@benke.co.uk>

pkgname=cutmp3
pkgver=3.0.3
pkgrel=1
pkgdesc="Edit mp3 (and mp2) files without quality loss"
arch=('any')
url="https://www.puchalla-online.de/cutmp3.html"
license=('GPL')
depends=('readline')
source=("https://github.com/tarjanm-movidius/cutmp3/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7fde60cbf9c57b1697cb86f9f95d073dbabb4281df2a3899861e0bd1531cbd01')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX="${pkgdir}/usr" install
}
