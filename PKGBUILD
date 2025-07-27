# Maintainer: Michael Schubert <mschu.dev at gmail> https://github.com/mschubert/PKGBUILDs
pkgname=latex-media9
_pkgname=${pkgname#latex-}
pkgver=1.30
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
sha256sums=('5ba1eafac310f7f6fd108f8cde216831c4b0653e75f8c957670fcd423c107d78')

package() {
  install -dm755 "$pkgdir"/usr/share/texmf
  unzip -d "$pkgdir"/usr/share/texmf $_pkgname-$pkgver.zip
}
