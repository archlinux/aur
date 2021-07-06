# Maintainer: buckket <felix@buckket.org>

pkgname=redo-sh
_pkgname=redo
pkgver=4.0.4
pkgrel=1
pkgdesc="Redo implementation in Bourne Shell."
arch=("any")
license=("AGPL3")
url="http://news.dieweltistgarnichtso.net/bin/redo-sh.html"
depends=("sh")
optdepends=("graphviz: dependency graph support via redo-dot")
provides=("redo")
conflicts=("redo")
source=("https://web.archive.org/web/20210113033847/http://news.dieweltistgarnichtso.net/bin/archives/redo-sh.tar.gz")
sha256sums=('67ee6ec9df900f8f429fb91f846d4544da01c9832f7af969dd573d0853a6f298')

package() {
  mkdir -p ${pkgdir}/usr/bin
  install -Dm755 bin/* "${pkgdir}/usr/bin/"
 
  mkdir -p ${pkgdir}/usr/share/man/man1
  install -Dm644 man/man1/* "${pkgdir}/usr/share/man/man1/"
}

