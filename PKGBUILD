# Maintainer: buckket <felix@buckket.org>

pkgname=redo-sh
_pkgname=redo
pkgver=2.3.0
pkgrel=1
pkgdesc="Redo implementation in Bourne Shell."
arch=("any")
license=("AGPL3")
url="http://news.dieweltistgarnichtso.net/bin/redo-sh.html"
depends=("sh")
optdepends=("graphviz: dependency graph support via redo-dot")
provides=("redo")
conflicts=("redo")
source=("https://web.archive.org/web/20190805141644/http://news.dieweltistgarnichtso.net/bin/archives/redo-sh.tar.gz")
sha256sums=('2ebf57bcbbdb9d2e759f71fe0043392398700640707234bc8d7ec16492b2c3b1')

package() {
  mkdir -p ${pkgdir}/usr/bin
  install -Dm755 bin/* "${pkgdir}/usr/bin/"
 
  mkdir -p ${pkgdir}/usr/share/man/man1
  install -Dm644 man/man1/* "${pkgdir}/usr/share/man/man1/"
}

