# Maintainer: itsagoodbrain1 <itsrottenisay@gmail.com>

pkgname=zettlr
pkgver=0.20.0
pkgrel=1
pkgdesc="A markdown editor for writing academic texts and taking notes"
arch=('x86_64')
url="https://www.zettlr.com"
license=('GPL')
depends=()
provides=(zettlr)
source=("${pkgname}-${pkgver}.rpm::https://github.com/Zettlr/Zettlr/releases/download/v${pkgver}/Zettlr-linux-x64-${pkgver}.rpm")
md5sums=(12ed787e3d875663b9afb8b402456ca6)
package() {
	mv $srcdir/opt $pkgdir/opt
	mv $srcdir/usr $pkgdir/usr
}


