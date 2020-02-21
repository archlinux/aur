# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=latex-tuda-ci-logos
pkgver=1.01
pkgrel=1
pkgdesc='Logos for TUDa-CI from Technische Universität Darmstadt'
arch=('any')
url='https://www.ce.tu-darmstadt.de/ce/latex_tuda/index.de.jsp'
license=('custom')
source=('local://logo_bundle.zip')
sha512sums=('d664eae76a40e8fe97ed7a84a4b3f287662ae631f4f5dc7885e31b6355bf9a846dff722839c99db79e4edd2ce13741ddfa7eb2e301e4c46dcf8f1b92d430466a')

package() {
  install -Dm644 "${srcdir}"/tex/latex/tuda-ci/tuda_logo.pdf "${pkgdir}"/usr/share/texmf/tex/latex/tuda-ci/tuda_logo.pdf
}
