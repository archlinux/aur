# Maintainer: madflow <madflow@web.de>
pkgname="omnidb-server"
pkgver=2.11.0
pkgrel=1
pkgdesc="Web tool for database management. Install this in any server, and it allows anybody with a web browser to connect to any database server."
arch=('i686' 'x86_64')
url="https://omnidb.org/"
license=('MIT')
depends=('python')
source_i686=("https://omnidb.org/dist/${pkgver}/omnidb-server_${pkgver}-debian-i386.deb")
source_x86_64=("https://omnidb.org/dist/${pkgver}/omnidb-server_${pkgver}-debian-amd64.deb")
options=("!strip")
sha256sums_i686=('c437b1c6dc1c1e8428db08d59f9652b080715cf2e4696002c9cf41c11d41198e')
sha256sums_x86_64=('1cdde9e84667e17eb000a57bf90bc4655a3ed8d29cb26946632434c9faee5bd5')

package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.gz"
}
