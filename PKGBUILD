# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=latex-tuda-ci-logos
pkgver=1.01
pkgrel=1
pkgdesc='Logos for TUDa-CI from Technische Universität Darmstadt'
arch=('any')
url='https://www.ce.tu-darmstadt.de/ce/latex_tuda/index.de.jsp'
license=('custom')
source=('local://logo_bundle.zip')
b2sums=('bad3ef7be4519eaecf8bae111d0a870c0b867a125da862afc1696170559653b9c724d29ea30f7dcd05055b6d208e99ea79440ee73b9918e1a972627b5d8b0ffb')

package() {
  install -Dm644 "${srcdir}"/tex/latex/tuda-ci/tuda_logo.pdf "${pkgdir}"/usr/share/texmf/tex/latex/tuda-ci/tuda_logo.pdf
}
