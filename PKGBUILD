# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=latex-enumitem
_pkgname=${pkgname#latex-}
pkgver=3.9
pkgrel=1
pkgdesc="Customize the three basic lists (enumerate, itemize and description)"
arch=('any')
url="http://www.ctan.org/tex-archive/macros/latex/contrib/enumitem"
license=(LPPL)
depends=(texlive-core)
makedepends=(unzip)
noextract=(enumitem.zip)
source=($_pkgname-$pkgver.zip::http://mirror.ctan.org/macros/latex/contrib/$_pkgname.zip)
install=$pkgname.install
sha256sums=('3b0354cfc32dee3ee1cfac2789a16d247f4ffefa6e84c0513c7ede6bb9b1089b')

package() {
  install -dm755 "$pkgdir"/usr/share/texmf
  unzip -d "$pkgdir"/usr/share/texmf/tex $_pkgname-$pkgver.zip
}
