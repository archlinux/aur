# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=latex-enumitem
_pkgname=enumitem
pkgver=3.5.2
pkgrel=1
pkgdesc="Customize the three basic lists (enumerate, itemize and description)"
arch=('any')
url="http://www.ctan.org/tex-archive/macros/latex/contrib/enumitem"
license=('unknown')
depends=('texlive-core')
noextract=('enumitem.zip')
source=("http://mirror.ctan.org/macros/latex/contrib/$_pkgname.zip")
install="$pkgname.install"
md5sums=('5a8b6a4262cdfedcc8595292eb9a570c')

package() {
  TEXMF="/usr/share/texmf"

  mkdir -p "$pkgdir/$TEXMF"
  unzip -d "$pkgdir/$TEXMF/tex" enumitem.zip
}
