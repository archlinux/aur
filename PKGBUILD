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
source=("https://github.com/xuyuan/pgf-umlsd/raw/master/release/${pkgname}-${pkgver}/pgf-umlsd.sty")
sha1sums=('396c99e6b6c24db157e1459c65feffed45840652')

package() {
  install -Dm644 "${srcdir}/${pkgname}.sty" "${pkgdir}/usr/share/texmf/tex/latex/${pkgname}/${pkgname}.sty"
}
