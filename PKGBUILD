# Maintainer: madflow <madflow@web.de>
pkgname="omnidb-server"
pkgver=2.4.0
pkgrel=1
pkgdesc="Web tool for database management. Install this in any server, and it allows anybody with a web browser to connect to any database server."
arch=('i686' 'x86_64')
url="https://omnidb.org/"
license=('MIT')
depends=('python')
source_i686=("https://omnidb.org/dist/${pkgver}/omnidb-server_${pkgver}-debian-i386.deb")
source_x86_64=("https://omnidb.org/dist/${pkgver}/omnidb-server_${pkgver}-debian-amd64.deb")
options=("!strip")
sha256sums_i686=('2e2fa6a119976d4f87c62c803371bf761ca36f7862b5ae582e55f37739ea72ca')
sha256sums_x86_64=('4e04967734ab22fe5a26779a6ca6196fb7571111c6369ee98990493c2d458070')

package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.gz"
}
