# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=pgf-umlsd
pkgver=0.7
pkgrel=3
pkgdesc="Some LaTeX macros for UML Sequence Diagrams"
url="https://www.ctan.org/pkg/pgf-umlsd"
license=('GPL3')
arch=('any')
depends=('texlive-core')
install=${pkgname}.install
source=("https://github.com/pgf-tikz/pgf-umlsd/raw/master/tex/latex/pgf-umlsd/pgf-umlsd.sty")
sha1sums=('f05f550f21fc6f6c95ebe54b6c8151faa6e24ec3')

package() {
  install -Dm644 "${srcdir}/${pkgname}.sty" "${pkgdir}/usr/share/texmf/tex/latex/${pkgname}/${pkgname}.sty"
}
