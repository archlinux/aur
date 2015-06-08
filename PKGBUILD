# Maintainer: coderkun <olli@coderkun.de>

pkgname=kbd-neo
pkgver=2
pkgrel=4
pkgdesc="NEO 2 terminal keyboard layout"
arch=('any')
url="http://www.neo-layout.org/"
license=('CC-BY-SA')
depends=('kbd')
source=(https://svn.neo-layout.org/linux/console/neo.map)

build() {
    cd $srcdir
    gzip -f neo.map
}

package() {
    cd $srcdir
    install -m 664 -D neo.map.gz $pkgdir/usr/share/kbd/keymaps/i386/qwertz/neo.map.gz
}

sha256sums=('a76b18524c4704e86f8c803ccf3cdc47d94f9ad19444080cad9020cc13b88ff2')
