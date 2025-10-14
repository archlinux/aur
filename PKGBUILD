# Maintainer: Dominik Wetzel <dimonok at web dot de>
# Maintainer: Antoine Viallon <antoine+aur@lesviallon.fr>
pkgname=pdfjam-extras
pkgdesc="Wrappers around pdfjam useful for merging, selecting pages, etc. one or more PDF documents"
pkgver=0.12
pkgrel=1
arch=("any")
source=("https://github.com/tobybreckon/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=("cc8c9be4c23506d2fc6bbdef83d05ffd")
depends=("texlive-binextra")
url="https://github.com/tobybreckon/pdfjam-extras"

provides=(
    "pdf180"
    "pdf270"
    "pdf90"
    "pdfbook"
    "pdfflip"
    "pdfjam-pocketmod"
    "pdfjam-slides3up"
    "pdfjam-slides6up"
    "pdfjoin"
    "pdfnup"
    "pdfpun"
)

conflicts=(
    "pdf180"
    "pdf270"
    "pdf90"
    "pdfbook"
    "pdfflip"
    "pdfjam-pocketmod"
    "pdfjam-slides3up"
    "pdfjam-slides6up"
    "pdfjoin"
    "pdfnup"
    "pdfpun"
)

package() {
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/man/man1"
	install -v -m755 "${srcdir}/${pkgname}-${pkgver}"/bin/* "${pkgdir}/usr/bin/"
	install -v -m644 "${srcdir}/${pkgname}-${pkgver}"/man1/* "${pkgdir}/usr/share/man/man1"
}

