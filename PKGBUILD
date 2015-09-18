# Maintainer: winlu <derwinlu+aur@gmail.com>

pkgname=visual_erlang
pkgver=0.1.0
pkgrel=1
pkgdesc="Latex notation for describing Erlang architectures"
url="https://github.com/lehoff/${pkgname}"
arch=('any')
license=('Apache')
depends=('texlive-latexextra')
source=("https://github.com/lehoff/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}.install")
install=${pkgname}.install
md5sums=('3fa20e85581ca0383d74296bfbbd40d6'
         '79f25671b6bcbe28ab9193aa2ed20c8b')

package() {
  mkdir -p "${pkgdir}/usr/share/texmf/tex/latex/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/visual-erlang.sty" "${pkgdir}/usr/share/texmf/tex/latex/${pkgname}"
  
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/visual-erlang.tex" "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/visual-erlang.pdf" "${pkgdir}/usr/share/doc/${pkgname}"
}
