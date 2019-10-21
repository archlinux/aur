# Maintainer: Cem Keylan <cem at ckyln dot com>

pkgname=bm
_pkgname=bm
pkgrel=1
pkgver=0.2
pkgdesc="command-line bibliography manager for biblatex"
url="https://git.ckyln.com/bm/log.html"
arch=('any')
license=('GPL3')
depends=('jq')
optdepends=('poppler: for getting DOI metadata from a pdf')
source=("https://git.ckyln.com/archives/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sum=('707e17500e390c867cee7bdf9fdd28ba')

provides=('bm')

package() {
	cd $srcdir/${pkgnamge}-${pkgver}
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
