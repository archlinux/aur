# Maintainer: coderkun <olli@coderkun.de>

pkgname=kbd-neo
pkgver=3
pkgrel=3
pkgdesc="NEO 2 terminal keyboard layout"
arch=('any')
url="http://www.neo-layout.org/"
license=('CC-BY-SA')
depends=('kbd')
source=(https://raw.githubusercontent.com/neo-layout/neo-layout/master/linux/console/neo.map)

build() {
    cd $srcdir
    gzip -f neo.map
}

package() {
    cd $srcdir
    install -m 664 -D neo.map.gz $pkgdir/usr/share/kbd/keymaps/i386/qwertz/neo.map.gz
}

sha256sums=('8f64e076a89178960e98e6e77e426be56bb040ed50dfc37894fafe1d46cbaea6')
