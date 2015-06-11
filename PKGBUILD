# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=latex-fitch-uoo
pkgver=0.5
pkgrel=1
pkgdesc="LaTeX macros for Fitch style natural deduction"
arch=('any')
url="http://www.mathstat.dal.ca/~selinger/fitch"
license=('GPL')
depends=('texlive-core')
install=fitch.install
source=('http://www.mathstat.dal.ca/~selinger/fitch/fitch-0.5.tgz')
sha256sums=('0d3173a63420eb5b9981b9c7db0bad0b24278272a666cc31e0c7af8a14ecc4af')

package() {
	cd "${srcdir}/fitch-${pkgver}"
	install -Dm644 fitch.sty "${pkgdir}/usr/share/texmf-dist/tex/latex/fitch"
	install -Dm644 fitchdoc.ps "${pkgdir}/usr/share/doc/latex-fitch-uoo.ps"
	## You can change .ps to .pdf if you prefer PDF over PostScript.
}

