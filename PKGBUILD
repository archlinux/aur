# Maintainer: madflow <madflow@web.de>
pkgname="omnidb-app"
pkgver=2.5.0
pkgrel=1
pkgdesc="Web tool for database management. This is a standalone version that can be used to connect to any database server."
arch=('i686' 'x86_64')
url="https://omnidb.org/"
license=('MIT')
depends=('python')
source_i686=("https://omnidb.org/dist/${pkgver}/omnidb-app_${pkgver}-debian-i386.deb")
source_x86_64=("https://omnidb.org/dist/${pkgver}/omnidb-app_${pkgver}-debian-amd64.deb")
options=("!strip")
sha256sums_i686=('fda1101068ce40e4a2bd3cf1b3ce8fe8129ac9634bb91ce34635e7a128aaac69')
sha256sums_x86_64=('f23c9f0775f77990cb05fffb7cc15de886dd74d2d703b6414d629acc24492f74')

package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.xz"
}
