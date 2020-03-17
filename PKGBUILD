# Maintainer: itsagoodbrain <itsrottenisay@gmail.com>

pkgname=zettlr-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="A markdown editor for writing academic texts and taking notes"
arch=('x86_64')
url="https://www.zettlr.com"
license=('GPL')
depends=()
optdepends=('pandoc: export support'
	    'texlive-bin: pdf etc support')
provides=(zettlr)
source=("https://github.com/Zettlr/Zettlr/releases/download/v${pkgver}/Zettlr-${pkgver}-x86_64.rpm")
sha256sums=(7a580ccd50e3a507696150b83c110ebbe290ebd7c66e5613a40da49d1e3005f6)
package() {
	mv $srcdir/opt $pkgdir/opt
	mv $srcdir/usr $pkgdir/usr
}
