# Maintainer: patrick <patrick at neumannsland dot de>
# Brought to you by: xu yuan, mohammed alfaki, lukas drude

pkgname=texlive-pgf-pie
pkgver=0.2.1
pkgrel=1
pkgdesc="Some LaTeX macros for pie chart by using PGF/Tikz package."
arch=('any')
url="https://github.com/xuyuan/pgf-pie/"
license=('GPL3')
depends=('texlive-core')
install=${pkgname}.install
source=("https://raw.githubusercontent.com/xuyuan/${pkgname#texlive-}/master/release/${pkgname#texlive-}-${pkgver}/${pkgname#texlive-}.sty")
sha256sums=('72786b844537dea67a7b2468d2828241fc17d56351f47c68e82d3054dfeabf28')

package() {
  mkdir -p ${pkgdir}/usr/share/texmf/tex/latex/${pkgname#texlive-}
  cp ${srcdir}/${pkgname#texlive-}.sty ${pkgdir}/usr/share/texmf/tex/latex/${pkgname#texlive-}
}
