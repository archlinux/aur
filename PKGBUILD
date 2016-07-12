# Maintainer: buckket <buckket@cock.li>

pkgname=redo-sh
_pkgname=redo
pkgver=1.2.0
pkgrel=1
pkgdesc="Redo implementation in Bourne Shell."
arch=("any")
license=("AGPL3")
url="http://news.dieweltistgarnichtso.net/bin/redo-sh.html"
depends=("sh")
optdepends=("graphviz: dependency graph support via redo-dot")
provides=("redo")
conflicts=("redo-c-git" "redo-python")
source=("http://daten.dieweltistgarnichtso.net/src/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('bcf8ecc7ea106089484eba5601f34567eca81ec1ac36d46c58061df7c6b9affc')

package() {
  mkdir -p ${pkgdir}/usr/bin
  install -Dm755 bin/* "${pkgdir}/usr/bin/"
 
  mkdir -p ${pkgdir}/usr/share/man/man1
  install -Dm644 man/man1/* "${pkgdir}/usr/share/man/man1/"
}

