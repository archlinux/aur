# Maintainer: madflow <madflow@web.de>
pkgname="omnidb-server"
pkgver=2.16.0
pkgrel=2
pkgdesc="Web tool for database management. Install this in any server, and it allows anybody with a web browser to connect to any database server."
arch=('x86_64')
url="https://omnidb.org/"
license=('MIT')
depends=('python')
source_x86_64=("https://omnidb.org/dist/${pkgver}/omnidb-server_${pkgver}-debian-amd64.deb")
options=("!strip")
sha256sums_x86_64=('0809c6146edca33a40965609bc84ef0d8fe059ca7fce73fc4c90765076175f85')

package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.xz"
}
