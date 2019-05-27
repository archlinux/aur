# Maintainer: madflow <madflow@web.de>
pkgname="omnidb-server"
pkgver=2.15.0
pkgrel=2
pkgdesc="Web tool for database management. Install this in any server, and it allows anybody with a web browser to connect to any database server."
arch=('x86_64')
url="https://omnidb.org/"
license=('MIT')
depends=('python')
source_x86_64=("https://omnidb.org/dist/${pkgver}/omnidb-server_${pkgver}-debian-amd64.deb")
options=("!strip")
sha256sums_x86_64=('998afe3c8c3b9733f8c08e88a4bebfd84ac804fa62359d84d2fd084891ffaf42')

package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.xz"
}
