# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=zaman
pkgver=1.1.0
pkgrel=2
pkgdesc="Print man pages in a PDF file (with vim keys support) for an easier reading"
arch=('any')
url="https://github.com/Antiz96/zaman"
license=('GPL3')
depends=('man-db' 'zathura' 'zathura-pdf-poppler' 'dmenu')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('314d791c0bb8f7378ec830003c654610bffa0b0ab7a9f49053d24e2b9591f502')

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
