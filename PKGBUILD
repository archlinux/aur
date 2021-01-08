# Maintainer: itsagoodbrain <itsrottenisay@gmail.com>

pkgname=zettlr-bin
pkgver=1.8.5
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
sha256sums=(bdc59657e4375836c5b265cfe8a6ca4a829eb3b79265ab01847367588b7b4d5b)
package() {
    mv $srcdir/opt $pkgdir/opt
    mv $srcdir/usr $pkgdir/usr
    mkdir -p $pkgdir/usr/bin
    ln -s /opt/Zettlr/Zettlr $pkgdir/usr/bin/zettlr
}
