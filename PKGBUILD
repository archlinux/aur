# Maintainer: confusedfla <sebi at notsharingmy dot info>
# Contributor: Eduard Bachmakov <e.bachmakov@gmail.com>
pkgname=moderntimeline
pkgver=20150306
pkgrel=1
pkgdesc="Timeline for the moderncv latex class"
arch=('any')
url="http://www.ctan.org/tex-archive/macros/latex/contrib/moderntimeline"
license=('GPL')
depends=('texlive-latexextra')
install=
source=("http://mirror.ctan.org/macros/latex/contrib/moderntimeline.zip")
md5sums=('ee03eee7bc9c1cab2613dde158824ff3')

package() {
  cd "$srcdir/moderntimeline"
  pdflatex moderntimeline.ins

  install -d ${pkgdir}/usr/share/texmf/tex/latex/moderntimeline
  install moderntimeline.sty ${pkgdir}/usr/share/texmf/tex/latex/moderntimeline

  install -d ${pkgdir}/usr/share/texmf/doc
  install moderntimeline.pdf ${pkgdir}/usr/share/texmf/doc
}


# vim:set ts=2 sw=2 et:
