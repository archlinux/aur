# Maintainer: Michael Schubert <mschu.dev at gmail> https://github.com/mschubert/PKGBUILDs
pkgname=latex-media9
_pkgname=${pkgname#latex-}
pkgver=1.25
pkgrel=1
pkgdesc="Embed video/sound (SWF, MP4, FLV, MP3) files in PDFs"
arch=(any)
url="http://www.ctan.org/pkg/$_pkgname"
license=(LPPL)
depends=(texlive-core)
makedepends=(unzip)
source=($_pkgname-$pkgver.zip::http://mirror.ctan.org/macros/latex/contrib/$_pkgname.zip)
install=$pkgname.install
noextract=($_pkgname.zip)
sha256sums=('5e728994a011c3ab0164e8ff95403ed8504e03e5ed57a25306b8650176f1f2f4')

package() {
  install -dm755 "$pkgdir"/usr/share/texmf
  unzip -d "$pkgdir"/usr/share/texmf $_pkgname-$pkgver.zip
}
