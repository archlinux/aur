# Maintainer: madflow <madflow@web.de>
pkgname="omnidb-server"
pkgver=2.6.0
pkgrel=1
pkgdesc="Web tool for database management. Install this in any server, and it allows anybody with a web browser to connect to any database server."
arch=('i686' 'x86_64')
url="https://omnidb.org/"
license=('MIT')
depends=('python')
source_i686=("https://omnidb.org/dist/${pkgver}/omnidb-server_${pkgver}-debian-i386.deb")
source_x86_64=("https://omnidb.org/dist/${pkgver}/omnidb-server_${pkgver}-debian-amd64.deb")
options=("!strip")
sha256sums_i686=('63669e004006d1cd87e05fe1b3f0f8c6c3f4faaf2e3a653130866ba1b2185397')
sha256sums_x86_64=('635a0675643ce311fbc43724aef2c773c2a925d008dbd78d5d2070beb10edbd3')

package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.gz"
}
