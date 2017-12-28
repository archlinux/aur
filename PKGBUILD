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
sha256sums_i686=('42f5608b8236ffa8f64b3cbbf1825881e0b1ac82bf15cb28317b5dbc62a90172')
sha256sums_x86_64=('18501c7709fff88c2742199d8662475c536a135fd04810cf989b7f427e85b8c4')

package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.gz"
}
