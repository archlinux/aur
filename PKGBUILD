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
sha256sums=('0235e29e9e5d1954044e453ac3006e21bab907638746fdcc5cea75b52a61e5e7')

package() {
  install -dm644 "$pkgdir"/usr/share/texmf
  unzip -d "$pkgdir"/usr/share/texmf/tex $_pkgname.zip
}
