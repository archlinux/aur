# Maintainer: Joey Dumont <joey.dumont@gmail.com>
# Contributor: confusedfla <sebi at notsharingmy dot info>
# Contributor: Eduard Bachmakov <e.bachmakov@gmail.com>
pkgname=moderntimeline
pkgver=20200611
pkgrel=1
pkgdesc="Timeline for the moderncv latex class"
arch=('any')
url="http://www.ctan.org/tex-archive/macros/latex/contrib/moderntimeline"
license=('GPL')
depends=('texlive-latexextra')
install=
source=("http://mirror.ctan.org/macros/latex/contrib/moderntimeline.zip")
sha256sums=('2922d1f8964a5c984dd489b4e98f3bd5cec231ee2ad54f4130243dc53ba36184')

package() {
  cd "$srcdir/moderntimeline"
  pdflatex moderntimeline.ins

  install -d "${pkgdir}/usr/share/texmf/tex/latex/moderntimeline"
  install moderntimeline.sty "${pkgdir}/usr/share/texmf/tex/latex/moderntimeline"

  install -d "${pkgdir}/usr/share/texmf/doc"
  install moderntimeline.pdf "${pkgdir}/usr/share/texmf/doc"
}

# vim:set ts=2 sw=2 et:
