# Maintainer: Michael Schubert <mschu.dev at gmail> https://github.com/mschubert/PKGBUILDs
pkgname=latex-media9
_pkgname=${pkgname#latex-}
pkgver=1.27
pkgrel=1
pkgdesc="Embed video/sound (SWF, MP4, FLV, MP3) files in PDFs"
arch=(any)
url="http://www.ctan.org/pkg/media9"
license=(LPPL)
depends=(texlive-core)
makedepends=(unzip)
source=($_pkgname-$pkgver.zip::http://mirror.ctan.org/macros/latex/contrib/$_pkgname.zip)
install=$pkgname.install
noextract=($_pkgname.zip)
sha256sums=('5c138f5c2aec3cf69f77373deff3d911988ea50582add30e951b41d842a9f325')

package() {
  install -dm755 "$pkgdir"/usr/share/texmf
  unzip -d "$pkgdir"/usr/share/texmf $_pkgname-$pkgver.zip
}
