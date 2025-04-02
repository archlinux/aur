# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=latex-enumitem
_pkgname=${pkgname#latex-}
pkgver=3.11
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
sha256sums=('112f692bc5c4909c2fa617fc72c470d9612394530f95728add3a50cb09555287')

package() {
  install -dm755 "$pkgdir"/usr/share/texmf
  unzip -d "$pkgdir"/usr/share/texmf/tex $_pkgname-$pkgver.zip
}
