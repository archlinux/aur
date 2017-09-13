# Maintainer: madflow <madflow@web.de>
pkgname="omnidb-app"
pkgver=2.1.0
pkgrel=1
pkgdesc="Web tool for database management. This is a standalone version that can be used to connect to any database server."
arch=('i686' 'x86_64')
url="https://omnidb.org/"
license=('MIT')
depends=('python')
source_i686=("https://omnidb.org/dist/${pkgver}/omnidb-app_${pkgver}-debian-i386.deb")
source_x86_64=("https://omnidb.org/dist/${pkgver}/omnidb-app_${pkgver}-debian-amd64.deb")
options=("!strip")
sha256sums_i686=('177c14804fcaab929c7ba3378da526eac0414ebccf181b322abe40638546ca78')
sha256sums_x86_64=('02b94c76eb048a703e3d344468bd55ff34eb6150b7ffc4294dd8b2e2599fd640')

package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.xz"
}
