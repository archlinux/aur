# Maintainer: madflow <madflow@web.de>
pkgname="omnidb-server"
pkgver=2.17.0
pkgrel=2
pkgdesc="Web tool for database management. Install this in any server, and it allows anybody with a web browser to connect to any database server."
arch=('x86_64')
url="https://omnidb.org/"
license=('MIT')
depends=('python')
source_x86_64=("https://github.com/OmniDB/OmniDB/releases/download/${pkgver}/omnidb-server_${pkgver}-debian-amd64.deb")
options=("!strip")
sha256sums_x86_64=('dc92fbf34e52aa730fad239542310680d55a523cda9c770b0edc28e782839942')

package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.xz"
}
