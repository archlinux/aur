# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=latex-pdfpages
_pkgname=${pkgname#latex-}
pkgver=0.4v
pkgrel=1
pkgdesc="Inclusion of external multi-page PDF documents in LATEX documents"
arch=('any')
url="http://www.ctan.org/tex-archive/macros/latex/contrib/pdfpages"
license=('unknown')
depends=('texlive-core')
noextract=("$_pkgname.zip")
source=("http://mirror.ctan.org/macros/latex/contrib/$_pkgname.zip")
install="$pkgname.install"
md5sums=('546702540a13f7f85fefd7ec68332f89')

package() {
  TEXMF="/usr/share/texmf"

  mkdir -p "$pkgdir/$TEXMF"
  unzip -d "$pkgdir/$TEXMF/tex" "$_pkgname.zip"
}

