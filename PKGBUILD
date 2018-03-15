# Maintainer: madflow <madflow@web.de>
pkgname="omnidb-server"
pkgver=2.6.0
pkgrel=1
pkgdesc="Web tool for database management. Install this in any server, and it allows anybody with a web browser to connect to any database server."
arch=('i686' 'x86_64')
url="https://omnidb.org/"
license=('MIT')
depends=('python')
source_i686=("https://omnidb.org/dist/${pkgver}/omnidb-server_${pkgver}-debian-i386.deb")
source_x86_64=("https://omnidb.org/dist/${pkgver}/omnidb-server_${pkgver}-debian-amd64.deb")
options=("!strip")
sha256sums_i686=('bdf61cb9f1719f749c26f7765719cc89d13bbf9455e615cbaae7262eadcd18dd')
sha256sums_x86_64=('ce1249b8f66fab8c620adcd6b8cb4136daf02bb2bcdc296c71a540d6113a977e')

package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.gz"
}
