# Maintainer: madflow <madflow@web.de>
pkgname="omnidb-server"
pkgver=2.1.0
pkgrel=1
pkgdesc="Web tool for database management. Install this in any server, and it allows anybody with a web browser to connect to any database server."
arch=('i686' 'x86_64')
url="https://omnidb.org/"
license=('MIT')
depends=('python')
source_i686=("https://omnidb.org/dist/${pkgver}/omnidb-server_${pkgver}-debian-i386.deb")
source_x86_64=("https://omnidb.org/dist/${pkgver}/omnidb-server_${pkgver}-debian-amd64.deb")
options=("!strip")
sha256sums_i686=('4cfadabbc5b0e672d945ce26f428db6c15120438b41a0dc0dbc19c0357a310bd')
sha256sums_x86_64=('a28a9e1249c32aa39b068e1ad2c7bd9ff35d1d6c99518470e050cc816e7c6cc7')

package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.gz"
}
