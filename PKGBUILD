# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=latex-media9
_pkgname=${pkgname#latex-}
pkgver=1.02
pkgrel=1
pkgdesc="Embed video/sound (SWF, MP4, FLV, MP3) files in PDFs"
arch=('any')
url="http://www.ctan.org/pkg/media9"
license=('LPPL')
depends=('texlive-core')
source=("$_pkgname-$pkgver.zip::http://tug.ctan.org/tex-archive/install/macros/latex/contrib/media9.tds.zip")
install="$pkgname.install"
noextract=('media9.tds.zip')
sha256sums=('304ca426549d5c2fb5d5bbd55026569abbc51627933ee825d6c07aedcd9462ae')

package() {
  install -dm755 "$pkgdir"/usr/share/texmf
  unzip -d "$pkgdir"/usr/share/texmf $_pkgname-$pkgver.zip
}
