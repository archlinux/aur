# Maintainer: itsagoodbrain <itsrottenisay@gmail.com>

pkgname=zettlr-bin
pkgver=1.7.2
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
sha256sums=(9b31075ca0f9cd0fd38f1be606a140c40a7a193bfccae45f9af346750c09a7b6)
package() {
    mv $srcdir/opt $pkgdir/opt
    mv $srcdir/usr $pkgdir/usr
    mkdir -p $pkgdir/usr/bin
    ln -s /opt/Zettlr/zettlr $pkgdir/usr/bin/zettlr
}
