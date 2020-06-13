# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=latex-media9
_pkgname=${pkgname#latex-}
pkgver=1.11
pkgrel=1
pkgdesc="Embed video/sound (SWF, MP4, FLV, MP3) files in PDFs"
arch=('any')
url="http://www.ctan.org/pkg/$_pkgname"
license=('LPPL')
depends=('texlive-core')
source=($_pkgname-$pkgver.zip::http://tug.ctan.org/tex-archive/install/macros/latex/contrib/$_pkgname.tds.zip)
install=$pkgname.install
noextract=($_pkgname.tds.zip)
sha256sums=('131b54ff6dd0f9a80ad8002adaa3bdcc219a1bb329176dcf152d9ca4d08ce950')

package() {
  install -dm755 "$pkgdir"/usr/share/texmf
  unzip -d "$pkgdir"/usr/share/texmf $_pkgname-$pkgver.zip
}
