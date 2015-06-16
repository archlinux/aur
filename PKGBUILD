# Maintainer: Sebastian Wilzbach <sebi at wilzbach dot me>
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
md5sums=('c92231ed0239a9e30f271cc25e9123c7')

package() {
  cd "$srcdir/moderntimeline"
  pdflatex moderntimeline.ins

  install -d ${pkgdir}/usr/share/texmf/tex/latex/moderntimeline
  install moderntimeline.sty ${pkgdir}/usr/share/texmf/tex/latex/moderntimeline

  install -d ${pkgdir}/usr/share/texmf/doc
  install moderntimeline.pdf ${pkgdir}/usr/share/texmf/doc
}


# vim:set ts=2 sw=2 et:
