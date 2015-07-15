# Maintainer: coderkun <olli@coderkun.de>

pkgname=kbd-neo
pkgver=3
pkgrel=1
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

sha256sums=('dd4b8693822817afef8b358adad9b9de7881d222e5f2476a69224bd7f7a2292d')
