# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=latex-media9
_pkgname=${pkgname#latex-}
pkgver=0.93
pkgrel=1
pkgdesc="Embed video/sound (SWF, MP4, FLV, MP3) files in PDFs"
arch=('any')
url="http://www.ctan.org/pkg/media9"
license=('LPPL')
depends=('texlive-core')
source=("http://tug.ctan.org/tex-archive/install/macros/latex/contrib/media9.tds.zip")
install="$pkgname.install"
noextract=('media9.tds.zip')
sha256sums=('62ad2680886594ad0421c4eaecacae344e08b1575af31c2d142d611ff9c9f5af')

package() {
  TEXMF="/usr/share/texmf"

  mkdir -p "$pkgdir/$TEXMF"
  unzip -d "$pkgdir/$TEXMF" media9.tds.zip
}
