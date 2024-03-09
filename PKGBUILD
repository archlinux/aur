# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
pkgname=latex-digsig
_pkgname=${pkgname#latex-}
pkgver=2.3
pkgrel=2
pkgdesc="LaTeX module to create a PDF file that can be digitally signed"
arch=('any')
url="http://home.htp-tel.de/lottermose2/tex/"
license=('MIT')
depends=('texlive-core')
source=(
  'http://home.htp-tel.de/lottermose2/tex/dist/digsig.sty'
  'http://home.htp-tel.de/lottermose2/tex/dist/digsig.sty.sign'
)
validpgpkeys=('EEF0BC10C2153CE424F20553CD153391B8322227')
install=$pkgname.install
sha256sums=(
  'abf7c6a154c071c63da4d69e3e745cb2255912ba83acf91ea3f8e33427177404'
  'SKIP'
)

package() {
  install -d ${pkgdir}/usr/share/texmf-dist/tex/latex/${_pkgname}
  install -Dm644 "${srcdir}/${_pkgname}.sty" "${pkgdir}/usr/share/texmf-dist/tex/latex/${_pkgname}"
}
