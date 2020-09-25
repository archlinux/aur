# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=latex-tuda-ci-logos
pkgver=3.03
pkgrel=2
pkgdesc='Logos for TUDa-CI from Technische Universität Darmstadt'
arch=('any')
url='https://www.ce.tu-darmstadt.de/ce/latex_tuda/index.de.jsp'
license=('custom')
source=('local://logo_bundle.zip')
b2sums=('662e3cb1a16703a7a8d6e73fe042752be4cd285db0a8a14fdd6b86ac1905551f67e46fba563971244fc41dc6e029996884eefabf7e05e28419309b661b263fb8')

package() {
  cd tex/latex/tuda-ci
  install -Dm644 -t "${pkgdir}"/usr/share/texmf/tex/latex/tuda-ci/ *.pdf
}
