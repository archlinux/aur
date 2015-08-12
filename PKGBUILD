# Contributor: Wenlong Chen <qzchenwl AT gmail.com>
# Maintainer: Emiliano Vavassori <syntaxerrormmm AT gmail.com>

pkgname=texlive-moderncv
pkgver=2.0.0
pkgrel=2
pkgdesc="A modern curriculum vitae class."
arch=('any')
url="http://www.ctan.org/pkg/moderncv/"
license=('GPL')
depends=('texlive-core' 'texlive-latexextra' 'texlive-fontsextra')
source=(moderncv-${pkgver}-${pkgrel}.zip::http://mirror.ctan.org/macros/latex/contrib/moderncv.zip)
md5sums=('01818d8bf1aa0812cee87cc7a2a9d471')
install=texlive-moderncv.install

package() {
  cd "${srcdir}"
  install -dm755 "${pkgdir}/usr/share/texmf/tex/latex"
  cp -r moderncv "${pkgdir}/usr/share/texmf/tex/latex"
}
