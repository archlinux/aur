# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=latex-tuda-ci-logos
pkgver=4.0
pkgrel=1
pkgdesc='Logos for TUDa-CI from Technische Universität Darmstadt'
arch=('any')
url='https://download.hrz.tu-darmstadt.de/protected/ULB/tuda_logo.pdf'
license=('custom')
source=('local://tuda_logo.pdf')
b2sums=('a7489d78e968996a41537f1957f6081cf4c6c7d64f9c5e9b3e293fda9e258c5b8a1aa647d85d78b80d3081f6e4c682236c240a761a8ccfaa1999a7758b2e740e')

package() {
  install -Dm644 -t "${pkgdir}"/usr/share/texmf/tex/latex/tuda-ci/ *.pdf
  install -Dm644 -t "${pkgdir}"/usr/share/texmf-dist/tex/latex/tuda-ci/ *.pdf
}
