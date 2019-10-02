# Maintainer: buckket <felix@buckket.org>

pkgname=redo-sh
_pkgname=redo
pkgver=3.0.0
pkgrel=1
pkgdesc="Redo implementation in Bourne Shell."
arch=("any")
license=("AGPL3")
url="http://news.dieweltistgarnichtso.net/bin/redo-sh.html"
depends=("sh")
optdepends=("graphviz: dependency graph support via redo-dot")
provides=("redo")
conflicts=("redo")
source=("https://web.archive.org/web/20191001095025/http://news.dieweltistgarnichtso.net/bin/archives/redo-sh.tar.gz")
sha256sums=('0c828614f2648a26fabbed5c5292a5ad187f298daae9cc6c6f6f01cae838587d')

package() {
  mkdir -p ${pkgdir}/usr/bin
  install -Dm755 bin/* "${pkgdir}/usr/bin/"
 
  mkdir -p ${pkgdir}/usr/share/man/man1
  install -Dm644 man/man1/* "${pkgdir}/usr/share/man/man1/"
}

