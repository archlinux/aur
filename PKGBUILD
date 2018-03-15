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
sha256sums_i686=('eacbed280594934d24965b1eac173fa9c46efc7b0ab6719ccea63c740ae082b8')
sha256sums_x86_64=('27b23ec46f26d468ce809a20ce5365f2d353c3e96a20af903e022d7ae95e2cae')

package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.xz"
}
