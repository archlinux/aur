# Maintainer:Lucas Eduardo Wendt <lucas59356@gmail.com>

pkgname=batmon-git
pkgver=v0.1
depends=('python')
makedepends=()
pkgrel=0
arch=(any)
pkgdesc="Monitores the battery level and saves somewhere for future analysis"
license=("custom")
options=(!strip)
url="https://github.com/lucasew/batmon"
install=batmon-git.install
source=("https://github.com/lucasew/batmon/archive/$pkgver.zip")
sha256sums=("4c9f301995fcf1e1be0e68039a18d2269c3907dc0866fcf2736809e7ba776590")

package() {
    mkdir $pkgdir/usr/bin -p
    cp $srcdir/batmon-*/batmond $pkgdir/usr/bin
    mkdir $pkgdir/etc/systemd/system -p
    cp $srcdir/batmon-*/batmond.service $pkgdir/etc/systemd/system
}
