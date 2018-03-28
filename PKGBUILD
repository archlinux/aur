# Maintainer: madflow <madflow@web.de>
pkgname="omnidb-app"
pkgver=2.6.0
pkgrel=1
pkgdesc="Web tool for database management. This is a standalone version that can be used to connect to any database server."
arch=('i686' 'x86_64')
url="https://omnidb.org/"
license=('MIT')
depends=('python')
source_i686=("https://omnidb.org/dist/${pkgver}/omnidb-app_${pkgver}-debian-i386.deb")
source_x86_64=("https://omnidb.org/dist/${pkgver}/omnidb-app_${pkgver}-debian-amd64.deb")
options=("!strip")
sha256sums_i686=('4cfc73b09345e83ca624552f9e4f0998d06bfa946dce35f01bc922323e6b8346')
sha256sums_x86_64=('4fbcddcd48708a0b4ccce18048ea80692fdf037872f555464867e88b0f028732')

package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.xz"
}
