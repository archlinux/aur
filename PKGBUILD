# Maintainer: itsagoodbrain1 <itsrottenisay@gmail.com>

pkgname=zettlr
pkgver=0.19.0
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="https://www.zettlr.com"
license=('GPL')
depends=()
provides=(zettlr)
source=("${pkgname}-${pkgver}.rpm::https://github.com/Zettlr/Zettlr/releases/download/v${pkgver}/Zettlr-linux-x64-${pkgver}.rpm")
md5sums=(f659bba0c7daeb9d6c3e3a51f2244ce0)
package() {
	mv $srcdir/opt $pkgdir/opt
	mv $srcdir/usr $pkgdir/usr
}


