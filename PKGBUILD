# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=latex-enumitem
_pkgname=${pkgname#latex-}
pkgver=3.7
pkgrel=1
pkgdesc="Customize the three basic lists (enumerate, itemize and description)"
arch=('any')
url="http://www.ctan.org/tex-archive/macros/latex/contrib/enumitem"
license=('unknown')
depends=('texlive-core' 'unzip')
noextract=('enumitem.zip')
source=("http://mirror.ctan.org/macros/latex/contrib/$_pkgname.zip")
install="$pkgname.install"
sha256sums=('1279d5435f0b1295f90135d8414dbdf6f09879039edea20b72feba7c67f5277d')

package() {
  install -dm755 "$pkgdir"/usr/share/texmf
  unzip -d "$pkgdir"/usr/share/texmf/tex enumitem.zip
}
