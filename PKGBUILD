# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
pkgname=latex-digsig
_pkgname=${pkgname#latex-}
pkgver=1.16
pkgrel=1
pkgdesc="LaTeX module to create a PDF file that can be digitally signed"
arch=('any')
url="http://home.htp-tel.de/lottermose2/tex/"
license=('LGPLv2.1')
depends=('texlive-core')
source=(http://home.htp-tel.de/lottermose2/tex/dist/digsig.sty)
install=$pkgname.install
sha256sums=('9a03519e08cc176ecac729c36bc022507f0be3bfc2383d5122a6e8a38a336833')

package() {
  install -d ${pkgdir}/usr/share/texmf-dist/tex/latex/${_pkgname}
  install -Dm644 "${srcdir}/${_pkgname}.sty" "${pkgdir}/usr/share/texmf-dist/tex/latex/${_pkgname}"
}
