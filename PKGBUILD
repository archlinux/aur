# Maintainer: madflow <madflow@web.de>
pkgname="omnidb-server"
pkgver=2.5.0
pkgrel=1
pkgdesc="Web tool for database management. Install this in any server, and it allows anybody with a web browser to connect to any database server."
arch=('i686' 'x86_64')
url="https://omnidb.org/"
license=('MIT')
depends=('python')
source_i686=("https://omnidb.org/dist/${pkgver}/omnidb-server_${pkgver}-debian-i386.deb")
source_x86_64=("https://omnidb.org/dist/${pkgver}/omnidb-server_${pkgver}-debian-amd64.deb")
options=("!strip")
sha256sums_i686=('9922c4fd97574f457ac95e47b5fb23afd092dad13c652c0e3759ef7c74999c64')
sha256sums_x86_64=('d3c9d53a199822e1231ba170d09ccf2883a2038341f08853ccd0dc63cdbe35d8')

package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.gz"
}
