# Maintainer: buckket <buckket@cock.li>

pkgname=redo-sh
_pkgname=redo
pkgver=1.1.6
pkgrel=5
pkgdesc="Redo implementation in Bourne Shell."
arch=("any")
license=("AGPL3")
url="http://news.dieweltistgarnichtso.net/bin/redo-sh.html"
depends=("sh")
optdepends=("graphviz: dependency graph support via redo-dot")
provides=("redo")
conflicts=("redo-c-git" "redo-git" "redo-python")
source=("http://daten.dieweltistgarnichtso.net/src/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('5f115693469023c0d75185bd457a9fa1b438cc0e5be3f9d0b3d160066bced2af')

package() {
  mkdir -p ${pkgdir}/usr/bin
  install -Dm755 bin/* "${pkgdir}/usr/bin/"
 
  mkdir -p ${pkgdir}/usr/share/man/man1
  install -Dm644 man/man1/* "${pkgdir}/usr/share/man/man1/"
}

