# Maintainer: buckket <buckket@cock.li>

pkgname=redo-sh
_pkgname=redo
pkgver=1.1.6
pkgrel=1
pkgdesc="Redo implementation in Bourne Shell."
arch=("any")
license=("GPL")
url="http://news.dieweltistgarnichtso.net/bin/redo-sh.html"
depends=("bash")
conflicts=("redo-c-git" "redo-git")
source=("http://daten.dieweltistgarnichtso.net/src/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('68577c4e97b3707ab23999fa5d8886cbd509ea528a5becb40a8cc34528d7e8f5')

package() {
  mkdir -p ${pkgdir}/usr/bin
  install -Dm755 bin/* "${pkgdir}/usr/bin/"
 
  mkdir -p ${pkgdir}/usr/share/man/man1
  install -Dm644 man/man1/* "${pkgdir}/usr/share/man/man1/"
}

