# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=latex-pdfpages
_name=${pkgname#latex-}
pkgver=0.5y
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
sha256sums=('072a3e5e2f718554ae2e814a8858f500cd4383a1c262d76f25ad9c377017c7f7')

package() {
  install -dm755 "$pkgdir"/usr/share/texmf
  unzip -d "$pkgdir"/usr/share/texmf/tex $_name-$pkgver.zip
}
