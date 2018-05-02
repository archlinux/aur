# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=latex-pdfpages
_pkgname=${pkgname#latex-}
pkgver=0.5l
pkgrel=2
pkgdesc="Inclusion of external multi-page PDF documents in LATEX documents"
arch=('any')
url="http://www.ctan.org/tex-archive/macros/latex/contrib/pdfpages"
license=('unknown')
depends=('texlive-core')
noextract=("$_pkgname.zip")
source=("http://mirror.ctan.org/macros/latex/contrib/$_pkgname.zip")
install="$pkgname.install"
md5sums=('3250764c95ab785560d83f6b5cab06a8')

package() {
  TEXMF="/usr/share/texmf"

  mkdir -p "$pkgdir/$TEXMF"
  unzip -d "$pkgdir/$TEXMF/tex" "$_pkgname.zip"
}
