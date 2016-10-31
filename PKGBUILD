# Maintainer: buckket <buckket@cock.li>

pkgname=redo-sh
_pkgname=redo
pkgver=1.2.4
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
sha256sums=('d7e43c09cc244d5a07c509ff8f30d37b1a97282aa0e1e6113d45689c55e97dea')

package() {
  mkdir -p ${pkgdir}/usr/bin
  install -Dm755 bin/* "${pkgdir}/usr/bin/"
 
  mkdir -p ${pkgdir}/usr/share/man/man1
  install -Dm644 man/man1/* "${pkgdir}/usr/share/man/man1/"
}

