# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=latex-pdfpages
_pkgname=${pkgname#latex-}
pkgver=0.5x
pkgrel=1
pkgdesc="Inclusion of external multi-page PDF documents in LATEX documents"
arch=(any)
url="http://www.ctan.org/tex-archive/macros/latex/contrib/pdfpages"
license=(LPPL)
makedepends=(unzip)
depends=(texlive-core)
noextract=($_pkgname.zip)
source=($_pkgname-$pkgver.zip::http://mirror.ctan.org/macros/latex/contrib/$_pkgname.zip)
install=$pkgname.install
sha256sums=('5054a27b8ead86d534965450ee9c1a79b7934b281fb4865c75cac7ab896cdce5')

package() {
  install -dm755 "$pkgdir"/usr/share/texmf
  unzip -d "$pkgdir"/usr/share/texmf/tex $_pkgname-$pkgver.zip
}
