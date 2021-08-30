# Maintainer: Michael Schubert <mschu.dev at gmail> https://github.com/mschubert/PKGBUILDs
pkgname=latex-media9
_pkgname=${pkgname#latex-}
pkgver=1.20
pkgrel=1
pkgdesc="Embed video/sound (SWF, MP4, FLV, MP3) files in PDFs"
arch=('any')
url="http://www.ctan.org/pkg/$_pkgname"
license=('LPPL')
depends=('texlive-core')
source=($_pkgname-$pkgver.zip::http://tug.ctan.org/tex-archive/install/macros/latex/contrib/$_pkgname.tds.zip)
install=$pkgname.install
noextract=($_pkgname.tds.zip)
sha256sums=('03377ecf63fd5ff1f40a02b28955355c126c5a57dcd3ca1f82e6a9703bebb8a9')

package() {
  install -dm755 "$pkgdir"/usr/share/texmf
  unzip -d "$pkgdir"/usr/share/texmf $_pkgname-$pkgver.zip
}
