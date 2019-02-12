# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=latex-enumitem
_pkgname=${pkgname#latex-}
pkgver=3.8
pkgrel=2
pkgdesc="Customize the three basic lists (enumerate, itemize and description)"
arch=('any')
url="http://www.ctan.org/tex-archive/macros/latex/contrib/enumitem"
license=('unknown')
depends=('texlive-core' 'unzip')
noextract=('enumitem.zip')
source=($_pkgname-$pkgver.zip::http://mirror.ctan.org/macros/latex/contrib/$_pkgname.zip)
install=$pkgname.install
sha256sums=('b2358a9013f9d88e95a26a62147b6e3df8b1525e2acac58002ea3b0b9ff58ef2')

package() {
  install -dm755 "$pkgdir"/usr/share/texmf
  unzip -d "$pkgdir"/usr/share/texmf/tex $_pkgname-$pkgver.zip
}
