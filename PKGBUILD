# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=zaman
pkgver=1.0.2
pkgrel=1
pkgdesc="Print man pages in a PDF file (with vim keys support) for an easier reading"
arch=('any')
url="https://github.com/Antiz96/zaman"
license=('GPL3')
depends=('man-db' 'zathura' 'zathura-pdf-poppler' 'dmenu')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c9e448b4afe1232c12da353c842b7d0443daa525d84bb2c4205330d7fcd26946')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
