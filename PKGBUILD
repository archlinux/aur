# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=latex-pdfpages
_pkgname=${pkgname#latex-}
pkgver=0.5t
pkgrel=1
pkgdesc="Inclusion of external multi-page PDF documents in LATEX documents"
arch=('any')
url="http://www.ctan.org/tex-archive/macros/latex/contrib/pdfpages"
license=('unknown')
depends=('texlive-core')
noextract=("$_pkgname.zip")
source=($_pkgname-$pkgver.zip::http://mirror.ctan.org/macros/latex/contrib/$_pkgname.zip)
install="$pkgname.install"
sha256sums=('b2537d4f84504d446da2841eddd4ef8a36aed78baa8d2e21d89ed87dd4346aad')

package() {
  install -dm755 "$pkgdir"/usr/share/texmf
  unzip -d "$pkgdir"/usr/share/texmf/tex $_pkgname-$pkgver.zip
}
