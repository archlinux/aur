# Maintainer: buckket <felix@buckket.org>

pkgname=redo-sh
_pkgname=redo
pkgver=3.1.1
pkgrel=1
pkgdesc="Redo implementation in Bourne Shell."
arch=("any")
license=("AGPL3")
url="http://news.dieweltistgarnichtso.net/bin/redo-sh.html"
depends=("sh")
optdepends=("graphviz: dependency graph support via redo-dot")
provides=("redo")
conflicts=("redo")
source=("https://mister-muffin.de/p/q2us.gz")
sha256sums=('f92d076f6c0cb80311a61be613016d6e84aaa70065b278ed96aa6f9c3da8c3da')

package() {
  mkdir -p ${pkgdir}/usr/bin
  install -Dm755 bin/* "${pkgdir}/usr/bin/"
 
  mkdir -p ${pkgdir}/usr/share/man/man1
  install -Dm644 man/man1/* "${pkgdir}/usr/share/man/man1/"
}

