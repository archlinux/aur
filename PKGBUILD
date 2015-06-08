# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=pgf-umlsd
pkgver=0.7
pkgrel=2
pkgdesc="Some LaTeX macros for UML Sequence Diagrams"
url="https://code.google.com/p/pgf-umlsd/"
license=('GPL3')
arch=('any')
depends=('texlive-core')
install=${pkgname}.install
source=("https://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.zip")
md5sums=('9857cef889b662879c2f78516adc0144')

package() {
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.sty" "${pkgdir}/usr/share/texmf/tex/latex/${pkgname}/${pkgname}.sty"
}
