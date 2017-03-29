# Maintainer: buckket <buckket@cock.li>

pkgname=redo-sh
_pkgname=redo
pkgver=2.0.0
pkgrel=1
pkgdesc="Redo implementation in Bourne Shell."
arch=("any")
license=("AGPL3")
url="http://news.dieweltistgarnichtso.net/bin/redo-sh.html"
depends=("sh")
optdepends=("graphviz: dependency graph support via redo-dot")
provides=("redo")
conflicts=("redo")
source=("http://daten.dieweltistgarnichtso.net/src/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('25add9413c6506df42b86fe88c14ab7edfb762b53dbcf7b133b6bc516f1ea734')

package() {
  mkdir -p ${pkgdir}/usr/bin
  install -Dm755 bin/* "${pkgdir}/usr/bin/"
 
  mkdir -p ${pkgdir}/usr/share/man/man1
  install -Dm644 man/man1/* "${pkgdir}/usr/share/man/man1/"
}

