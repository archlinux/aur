# Maintainer: madflow <madflow@web.de>
pkgname="omnidb-server"
pkgver=2.2.0
pkgrel=1
pkgdesc="Web tool for database management. Install this in any server, and it allows anybody with a web browser to connect to any database server."
arch=('i686' 'x86_64')
url="https://omnidb.org/"
license=('MIT')
depends=('python')
source_i686=("https://omnidb.org/dist/${pkgver}/omnidb-server_${pkgver}-debian-i386.deb")
source_x86_64=("https://omnidb.org/dist/${pkgver}/omnidb-server_${pkgver}-debian-amd64.deb")
options=("!strip")
sha256sums_i686=('124693d550d8efa6521e08b3d1e2066deb62a4fbdf7fabde3c420bbba69c9f4c')
sha256sums_x86_64=('421a8efeafa515a2ed50ee98b4addb7312485579e3af7ef66d3564418005c22a')

package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.gz"
}
