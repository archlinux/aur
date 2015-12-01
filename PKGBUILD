# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=latex-media9
_pkgname=media9
pkgver=0.61
pkgrel=1
pkgdesc="Embed video/sound (SWF, MP4, FLV, MP3) files in PDFs"
arch=('any')
url="http://www.ctan.org/pkg/media9"
license=('LPPL')
depends=('texlive-core')
source=("http://tug.ctan.org/tex-archive/install/macros/latex/contrib/media9.tds.zip")
install="$pkgname.install"
noextract=('media9.tds.zip')
md5sums=('0fe04f114659779b01ced03f19cebe4d')

package() {
  TEXMF="/usr/share/texmf"

  mkdir -p "$pkgdir/$TEXMF"
  unzip -d "$pkgdir/$TEXMF" media9.tds.zip
}

