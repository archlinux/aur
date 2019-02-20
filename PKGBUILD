# Maintainer: itsagoodbrain <itsrottenisay@gmail.com>

pkgname=zettlr-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A markdown editor for writing academic texts and taking notes"
arch=('x86_64')
url="https://www.zettlr.com"
license=('GPL')
depends=()
provides=(zettlr)
source=("${pkgname}-${pkgver}.rpm::https://github.com/Zettlr/Zettlr/releases/download/v${pkgver}/Zettlr-linux-x64-${pkgver}.rpm")
md5sums=(c143fbe111132d4851bbabd82a8acb38)
package() {
	mv $srcdir/opt $pkgdir/opt
	mv $srcdir/usr $pkgdir/usr
}


