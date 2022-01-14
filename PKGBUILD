# Maintainer: itsagoodbrain <itsrottenisay@gmail.com>

pkgname=zettlr-bin
pkgver=2.1.1
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
sha256sums=(8dd0ce7949860d1a57405c270249d0223d53150ffde348fda70df2e8e91e189a)
package() {
    mv $srcdir/opt $pkgdir/opt
    mv $srcdir/usr $pkgdir/usr
    mkdir -p $pkgdir/usr/bin
    ln -s /opt/Zettlr/Zettlr $pkgdir/usr/bin/zettlr
}
