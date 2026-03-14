# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=latex-pdfpages
_name=${pkgname#latex-}
pkgver=0.6g
pkgrel=1
pkgdesc="Inclusion of external multi-page PDF documents in LATEX documents"
arch=(any)
url="http://www.ctan.org/tex-archive/macros/latex/contrib/pdfpages"
license=(LPPL)
makedepends=(unzip)
depends=(texlive-core)
noextract=($_name.zip)
source=($_name-$pkgver.zip::http://mirror.ctan.org/macros/latex/contrib/$_name.zip)
install=$pkgname.install
sha256sums=('450645ad269559af9f3e2052c2e04413009fd8349c56814e90d4e73bd10bd519')

package() {
  install -dm755 "$pkgdir"/usr/share/texmf
  unzip -d "$pkgdir"/usr/share/texmf/tex $_name-$pkgver.zip
}
