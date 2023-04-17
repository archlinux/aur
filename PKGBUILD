# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=latex-mathabx
_pkgname=${pkgname#latex-}
pkgver=2005.05.18
pkgrel=1
pkgdesc="Mathematical symbols not included in the standard distribution"
arch=(any)
url="http://www.ctan.org/tex-archive/fonts/mathabx"
license=(LPPL)
depends=(texlive-core)
makedepends=(unzip)
source=($_pkgname-$pkgver.zip::http://mirror.ctan.org/fonts/mathabx.zip)
install="$pkgname.install"
sha256sums=('f204676a5ea811237cdad10effb5a9d5ea0d520cece30c6f67623b496b8442cf')

package() {
  install -dm755 "$pkgdir"/usr/share/texmf
  unzip -d "$pkgdir"/usr/share/texmf/tex $_pkgname-$pkgver.zip
}
