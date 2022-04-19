# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=latex-pdfpages
_pkgname=${pkgname#latex-}
pkgver=0.5u
pkgrel=1
pkgdesc="Inclusion of external multi-page PDF documents in LATEX documents"
arch=('any')
url="http://www.ctan.org/tex-archive/macros/latex/contrib/pdfpages"
license=('unknown')
depends=('texlive-core')
noextract=("$_pkgname.zip")
source=($_pkgname-$pkgver.zip::http://mirror.ctan.org/macros/latex/contrib/$_pkgname.zip)
install=$pkgname.install
sha256sums=('a344c398837e6780b29338300e93bac16785c28c6f69b93a2101a76ef5a1a05e')

package() {
  install -dm755 "$pkgdir"/usr/share/texmf
  unzip -d "$pkgdir"/usr/share/texmf/tex $_pkgname-$pkgver.zip
}
