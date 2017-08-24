# Maintainer: madflow <madflow@web.de>
pkgname="omnidb-app"
pkgver=2.0.4
pkgrel=1
pkgdesc="Web tool for database management. This is a standalone version that can be used to connect to any database server."
arch=('i686' 'x86_64')
url="https://omnidb.org/"
license=('MIT')
depends=('python')
source_i686=("https://omnidb.org/dist/${pkgver}/omnidb-app_${pkgver}-debian-i386.deb")
source_x86_64=("https://omnidb.org/dist/${pkgver}/omnidb-app_${pkgver}-debian-amd64.deb")
options=("!strip")
sha256sums_i686=('b3ad7085ab999f3c8f8db05335a5ef5cd2a8db96e36006f46419ec711d6961a5')
sha256sums_x86_64=('6ac984a6cb61819fd6289653532dc69ab5e6f667601a481b2add6bb820c4a02e')

package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.xz"
}
