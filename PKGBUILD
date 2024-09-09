# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=latex-pdfpages
_name=${pkgname#latex-}
pkgver=0.6b
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
sha256sums=('1a511d057f751117d1d420b497375d02772bd16aac2f90127f3ab7e335555db0')

package() {
  install -dm755 "$pkgdir"/usr/share/texmf
  unzip -d "$pkgdir"/usr/share/texmf/tex $_name-$pkgver.zip
}
