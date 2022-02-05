# Maintainer: itsagoodbrain <itsrottenisay@gmail.com>

pkgname=zettlr-bin
pkgver=2.1.3
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
sha256sums=(b8bd18606c2b879ae90d6cceb88fa23ecb777b2750c9270d28b627066152c428)
package() {
    mv $srcdir/opt $pkgdir/opt
    mv $srcdir/usr $pkgdir/usr
    mkdir -p $pkgdir/usr/bin
    ln -s /opt/Zettlr/Zettlr $pkgdir/usr/bin/zettlr
}
