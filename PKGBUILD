# Maintainer: madflow <madflow@web.de>
pkgname="omnidb-server"
pkgver=2.15.0
pkgrel=1
pkgdesc="Web tool for database management. Install this in any server, and it allows anybody with a web browser to connect to any database server."
arch=('x86_64')
url="https://omnidb.org/"
license=('MIT')
depends=('python')
source_x86_64=("https://omnidb.org/dist/${pkgver}/omnidb-server_${pkgver}-debian-amd64.deb")
options=("!strip")
sha256sums_x86_64=('1795dc6b977bfc55f75fc96ffde8d123cae186e2788521baa328e493e35f6d25')

package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.gz"
}
