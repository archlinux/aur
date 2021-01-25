# Maintainer: itsagoodbrain <itsrottenisay@gmail.com>

pkgname=zettlr-bin
pkgver=1.8.7
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
sha256sums=(94c3dd9293c8d29a01ee0ab07165581a956c2c993be17c69eb0c87ccf0c06e78)
package() {
    mv $srcdir/opt $pkgdir/opt
    mv $srcdir/usr $pkgdir/usr
    mkdir -p $pkgdir/usr/bin
    ln -s /opt/Zettlr/Zettlr $pkgdir/usr/bin/zettlr
}
