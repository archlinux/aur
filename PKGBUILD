# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=latex-pdfpages
_name=${pkgname#latex-}
pkgver=0.6f
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
sha256sums=('528ff47a941e0dfb933271550508eb05c864f87ed6db4f2550e108c826e0f29e')

package() {
  install -dm755 "$pkgdir"/usr/share/texmf
  unzip -d "$pkgdir"/usr/share/texmf/tex $_name-$pkgver.zip
}
